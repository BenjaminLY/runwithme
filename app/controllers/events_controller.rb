class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy, :add_pictures ]

  def index
    @public_events = policy_scope(Event).where(private: false)
    @my_private_events = policy_scope(Event).my_private_events(current_user)
    if params[:filter] == 'public'
      @events = policy_scope(Event).public
    elsif params[:filter] == 'Own_run'
      @event.user
    elsif params[:filter] == 'private'
      # @events = policy_scope(Event).my_private_events(current_user)
      @events = current_user.private_events
    elsif params[:filter] == 'refused'
      @events = current_user.refused_events
    else
      @events = policy_scope(Event).public + current_user.private_events
      @events.sort_by! { |ev| ev[:datetime].to_i }
    end
    # @events = @events.group_by(&:datetime)
    @events = @events.group_by{ |e| e.datetime.to_date }
  end

  def show
    @message = Message.new(event_id: @event.id)
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
    if params['datetime'].present?
      time = Time.new(2000, 01, 01, event_time_params['hour'], event_time_params['minute'], 0, "+02:00")
      event_params['datetime'] = event_params['datetime'].to_datetime + time.seconds_since_midnight.seconds
    end

    @event = Event.new(event_params)
    @event.user = current_user
    @participation = Participation.new(status: "going")
    @participation.user = current_user
    @participation.event = @event
    authorize @event

    if @event.save && @participation.save
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
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
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


