class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params["room_id"]}"
    puts "接続しました"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message  = Message.create!(content: data["message"], user_id: current_user.id, room_id: params["room_id"])
    template = ApplicationController.render_with_signed_in_user(current_user, partial: "messages/message", locals: {message: message})
    ActionCable.server.broadcast "room_channel_#{params["room_id"]}", template
  end
end
