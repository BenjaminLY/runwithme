class MessagesController < ApplicationController
	def create
		@message = Message.new(content: params[:message][:content])
		@event = Event.find(params[:event_id])
		@user = current_user
		@message.event = @event
		@message.user = @user
		authorize @message
    if @message.save
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
end
