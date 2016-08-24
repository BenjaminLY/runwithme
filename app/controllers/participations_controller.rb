class ParticipationsController < ApplicationController
	before_action :set_event, only: [:create]
	skip_after_action :verify_authorized

	def create
		@participation = Participation.new(status: params[:status])
		@participation.user = current_user
		@participation.event = @event
		@events = policy_scope(Event).where(private: false)
		@my_events = Event.my_private_events(current_user)
		@type = params[:type] || "index"
		if @participation.save
     	respond_to do |format|
				format.html { redirect_to event_path(@event) }
				format.js  # <-- will render `app/views/reviews/create.js.erb`
     	end
		else
     	respond_to do |format|
				format.html { render 'events/show' }
				format.js  # <-- idem
	  	end
		end
	end

	def update
		@participation = Participation.find(params[:id])
		@participation.status = params[:status]
		@type = params[:type] || "index"
		@event = @participation.event
		if @participation.save
			@events = policy_scope(Event).where(private: false)
			@my_events = Event.my_private_events(current_user)
     		respond_to do |format|
				format.html { redirect_to event_path(@event) }
				format.js  # <-- will render `app/views/reviews/update.js.erb`
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
