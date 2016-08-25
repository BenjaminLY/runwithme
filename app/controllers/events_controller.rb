class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy, :edit_pictures, :add_pictures ]

  def index
    @events = policy_scope(Event).where(private: false)
    @my_events = Event.my_private_events(current_user)
  end

  def show
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

  def edit_pictures
  end

  def add_pictures
    @event.update(event_picture) 
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

  def event_picture
    params.require(:event).permit(:photo)
  end

end


