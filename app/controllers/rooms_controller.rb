class RoomsController < ApplicationController
  layout "no_footer"

  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: @room.id)
  end

  def create
    @user = User.find(params[:user_id])
    #UserRoom内のuser_idがcurrent_userと同じUserRoom
    @currentUserRooms = UserRoom.where(user_id: current_user.id)
    #UserRoom内のuser_idがparams[:user_id]と同じUserRoom
    @targetUserRooms = UserRoom.where(user_id: @user.id)

    unless current_user == @user
      room_find_or_create(@currentUserRooms, @targetUserRooms)
      redirect_to room_path(@room)
    end
    
  end

  private

  def room_find_or_create(rooms, other_rooms)
    if rooms.any? && other_rooms.any?
      rooms.each do |room|
        other_rooms.each do |other_room|
          if room.room_id == other_room.room_id
            @room = room.room
          end
          if @room.nil?
            next
          end
        end
        if @room.nil?
          next
        else
          break
        end
      end
      if @room.nil?
        @room = Room.new
        @room.save
        current_user.user_room(@room)
        @user.user_room(@room)
      end
    else
      @room = Room.new
      @room.save
      current_user.user_room(@room)
      @user.user_room(@room)
    end
  end

end
