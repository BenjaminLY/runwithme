class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @public_events = policy_scope(Event).where(private: false)
    @my_private_events = policy_scope(Event).my_private_events(current_user)
    if params[:filter] == 'public'
      @events = policy_scope(Event).public
    elsif params[:filter] == 'private'
      # @events = policy_scope(Event).my_private_events(current_user)
      @events = current_user.private_events
    elsif params[:filter] == 'refused'
      @events = current_user.refused_events
    else
      @events = policy_scope(Event).public + current_user.private_events
      @events.sort_by! { |ev| ev[:datetime].to_i }
    end
    @events = @events.group_by(&:datetime)
  end

  def show
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
     marker.lat event.latitude
     marker.lng event.longitude
     # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @participation = Participation.new(status: "going")
    @participation.user = current_user
    @participation.event = @event
    authorize @event
    if @event.save && @participation.save
      redirect_to event_path(@event)
    else
      render :new
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

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:datetime, :private, :type_of, :description,
      :meeting_point, :address, :time_goal, :trail_goal, :photo)
  end

end


