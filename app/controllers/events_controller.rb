class EventsController < ApplicationController
  before_action :set_event

  def show
  end



  private
  def set_event
    @event = Event.find(params[:id])
  end
end
