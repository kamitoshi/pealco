require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーモデルに関するテスト" do
    
    let(:user) {build(:user)}

    context "有効なユーザー" do

      it "不備のないユーザーデータの登録" do
        expect(user).to be_valid
      end
      
    end

    context "無効なユーザー" do

      it "名前がない" do
        user.name = ""
        expect(user).to_not be_valid
      end

      it "名前が20文字を超える" do
        user.name = "a"*21
        expect(user).to_not be_valid
      end

      it "自己紹介文が400文字を超える" do
        user.introduction = "a"*401
        expect(user).to_not be_valid
      end

      it "emailがない" do
        user.email = ""
        expect(user).to_not be_valid
      end

      it "emailが一意でない" do
        dup_user_email = user.email.dup
        user.save
        other_user = build(:other_user, email: dup_user_email)
        expect(other_user).to_not be_valid
      end

      it "パスワードがない" do
        user.password= ""
        expect(user).to_not be_valid
      end

    end
  end
end
