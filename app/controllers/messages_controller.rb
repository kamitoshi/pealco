class MessagesController < ApplicationController

  def create
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end

end
