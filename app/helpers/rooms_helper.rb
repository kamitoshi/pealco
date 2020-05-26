module RoomsHelper

  # チャットの相手の名前を取り出す
  def communication_user_name(users)
    users.each do |user|
      unless user.name == current_user.name
        return user.name
      end
    end
  end

end
