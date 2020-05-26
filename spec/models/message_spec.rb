require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "メッセージに関するテスト" do

    let(:user) {create(:user)}
    let(:room) {create(:room)}

    context "有効なメッセージ" do
      
      it "不備のないメッセージ" do
        message = build(:message, user_id: user.id, room_id: room.id)
        expect(message).to be_valid
      end

    end

    context "無効なメッセージ" do
      
      it "送信者の居ないメッセージ" do
        message = build(:message, user_id: nil, room_id: room.id)
        expect(message).to_not be_valid
      end
      
      it "チャットルームが作成されていない部屋へのメッセージ" do
        message = build(:message, user_id: user.id, room_id: nil)
        expect(message).to_not be_valid
      end

    end

  end
end
