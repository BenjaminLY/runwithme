class ParticipationsController < ApplicationController
	before_action :set_event, only: [:create, :edit, :update]

	def create
		@participation = Participation.new(status: params[:status])
		@participation.user = current_user
		@participation.event = @event
		@participation.save
	end

	def edit
		
	end

	def update
		
	end

	private

	def set_event
		@event = Event.find(params[:event_id])
		
	end

end
