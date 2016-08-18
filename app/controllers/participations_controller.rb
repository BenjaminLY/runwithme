class ParticipationsController < ApplicationController
	before_action :set_event, only: [:create, :edit, :update]

	def create
		
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
