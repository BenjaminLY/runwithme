class ParticipationsController < ApplicationController
	before_action :set_event, only: [:create]

	def create
		@participation = Participation.new(status: params[:status])
		@participation.user = current_user
		@participation.event = @event
		if @participation.save
			redirect_to events_path
		else
			render "events/index"
		end
	end

	def update
		@participation = Participation.find(params[:id])
		@participation.status = params[:status]
		if @participation.save
     	respond_to do |format|
       format.html { redirect_to profile_path }
       format.js  # <-- will render `app/views/reviews/create.js.erb`
     	end
		else
     	respond_to do |format|
       format.html { render 'events/show' }
       format.js  # <-- idem
		  end
		end
	end

	private

	def set_event
		@event = Event.find(params[:event_id])
	end


end
