class MessagesController < ApplicationController
	skip_after_action :verify_authorized, only: [ :create ]

		def create
			@message = Message.new(content: params[:message][:content])
			@event = Event.find(params[:event_id])
			@user = current_user
			@message.event = @event
			@message.user = @user
			@message.save
			redirect_to event_path(@event)
		end
	
end
