class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy, :add_pictures ]

  def index
    @public_events = policy_scope(Event).where(private: false)
    @my_private_events = policy_scope(Event).my_private_events(current_user)
    @filter = params[:filter]

    if @filter == 'public'
      @events = Event.joins(:user).where(private: false, users: {company: current_user.company})
    elsif @filter == 'Own_run'
      @events = Event.where(user_id: current_user)
      @my_participations = current_user.events_only_as_participant
    elsif @filter == 'private'
      # @events = policy_scope(Event).my_private_events(current_user)
      @events = current_user.private_events
    elsif @filter == 'refused'
      @events = currener.refused_events
    elsif @filter == 'challenge'
      @events = Event.joins(:user).where.not(users: {company: current_user.company})
    else
      @events = Event.where(private: false) + current_user.private_events
      @events.sort_by! { |ev| ev[:datetime].to_i }
    end
    # @events = @events.group_by(&:datetime)
    @events_sorted = @events.group_by{ |e| e.datetime.to_date }
    @my_participations_sorted = @my_participations.group_by{ |e| e.datetime.to_date } if @my_participations
  end

  def show
    @message = Message.new(event_id: @event.id)
    @events = Event.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      if event.latitude && event.longitude
        marker.lat event.latitude
        marker.lng event.longitude
      end
     # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    invited_users_id = params['event']['user_ids']
    invited_users_id.shift
    if params['event']['user_id'].present?
      invited_users_id << params['event']['user_id']
    end
    params = event_params

    if params['datetime'].present?
      time = Time.new(2000, 01, 01, event_time_params['hour'], event_time_params['minute'], 0, "+02:00")
      params['datetime'] = event_params['datetime'].to_datetime + time.seconds_since_midnight.seconds
    end

    @event = Event.new(params)
    @event.user = current_user
    @participation = Participation.new(status: "going")
    @participation.user = current_user
    @participation.event = @event
    authorize @event

    if @event.save && @participation.save
      if invited_users_id.present?
        invited_users_id.each do |user_id|
          Participation.create(event_id: @event.id, user_id: user_id, status: "maybe")
        end
      end
      @event.create_activity :create, owner: current_user
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js  # <-- 'app/views/events/create.js.erb'
      end
    else
      respond_to do |format|
        format.html { render 'new', event: @event }
        format.js  # <-- 'app/views/events/create.js.erb'
      end
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      @event.create_activity :update, owner: current_user
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.create_activity :destroy, owner: current_user
    @event.destroy
    redirect_to events_path
  end

  def add_pictures
    @event.update(event_picture)
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:datetime, :private, :type_of, :description,
      :meeting_point, :address, :time_goal, :trail_goal)
  end

  def event_time_params
    params.require(:date).permit(:hour, :minute)
  end

  def event_picture
    params.require(:event).permit(photos: [])
  end

end


