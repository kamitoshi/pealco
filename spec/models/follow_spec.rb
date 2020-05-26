require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "フォローモデルに関するテスト" do

    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}

    context "有効なフォロー" do

      it "フォローすることができる" do
        follow = user.follows.build(follow_id: other_user.id)
        expect(follow).to be_valid
      end

    end

    context "無効なフォロー" do

      it "フォロー相手がいない" do
        follow = user.follows.build(follow_id: nil)
        expect(follow).to_not be_valid
      end

      it "既にフォローしている" do
        follow = user.follows.build(follow_id: other_user.id)
        dup_follow = follow.dup
        follow.save
        expect(dup_follow).to_not be_valid
      end

    end
  end
end
