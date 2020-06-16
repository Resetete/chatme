class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params) # the the message from the params to the current user (build the connection between the user and the message ressource)
    if message.save
      redirect_to root_path # when the message can be saved than go back to chatroom
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
