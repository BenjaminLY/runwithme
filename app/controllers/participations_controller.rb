class ParticipationsController < ApplicationController
	before_action :set_event, only: [:create]
	skip_after_action :verify_authorized

	def create
		@participation = Participation.new(status: params[:status])
		@participation.user = current_user
		@participation.event = @event
		@events = policy_scope(Event).where(private: false)
		@my_events = Event.my_private_events(current_user)
		if @participation.save
			redirect_to events_path
		else
			render events_path
		end
	end

	def update
		@participation = Participation.find(params[:id])
		@participation.status = params[:status]
		if @participation.save
			@events = policy_scope(Event).where(private: false)
			@my_events = Event.my_private_events(current_user)
     	respond_to do |format|
				format.html { redirect_to events_path }
				format.js  # <-- will render `app/views/reviews/create.js.erb`
     	end
		else
			@event = @participation.event
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
