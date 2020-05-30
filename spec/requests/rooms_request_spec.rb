require 'rails_helper'

RSpec.describe "Rooms", type: :request do

  before do
    @user = create(:user)
    @other_user = create(:other_user)
    @room = create(:room)
    UserRoom.create(user_id: @user.id, room_id: @room.id)
    UserRoom.create(user_id: @other_user.id, room_id: @room.id)
  end

  context "チャットルーム" do
    it "ログインしている状態" do
      sign_in(@user)
      visit room_path(@room)
      expect(response).to_not have_http_status(:success)
    end
    it "ログインしていない状態" do
      visit room_path(@room)
      expect(response).to_not have_http_status(:success)
    end
  end

end
