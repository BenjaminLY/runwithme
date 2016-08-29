class MessagesController < ApplicationController
	def create
		@message = Message.new(content: params[:message][:content])
		@event = Event.find(params[:event_id])
		@user = current_user
		@message.event = @event
		@message.user = @user
		authorize @message
		@message.save
		redirect_to event_path(@event)
	end	
end
