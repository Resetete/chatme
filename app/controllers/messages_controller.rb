class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params) # the the message from the params to the current user (build the connection between the user and the message ressource)
    if message.save
      ActionCable.server.broadcast 'chatroom_channel',
                                    modified_message: message_render(message) # what you send here will be received by the coffee file "received data"
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message }) # render a partial _message.html.erb from the controller
  end
end
