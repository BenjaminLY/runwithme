class EventsController < ApplicationController
  before_action :set_event, only: [ :show ]

  def index
    @events = Event.all
  end

  def show
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }

    if @event.latitude &&  @event.longitude
       @hash = Gmaps4rails.build_markers(@event) do |event, marker|
         marker.lat event.latitude
         marker.lng event.longitude
         # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
        end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :datetime, :public, :kind, :description,
      :place_name, :address, :time_goal, :trail_goal, :nb_of_participants, :photo)
  end
end
