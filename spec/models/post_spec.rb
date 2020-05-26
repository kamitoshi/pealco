require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "投稿に関するテスト" do

    let(:user) {create(:user)}
    let(:alc_category) {create(:alc_category)}
    let(:menu_category) {create(:menu_category)}
    let(:post) {create(:post)}

    context "有効な投稿" do

      it "不備のない投稿" do
        expect(post).to be_valid
      end

    end

    context "無効な投稿" do

      it "タイトルがない" do
        post.title = ""
        expect(post).to_not be_valid
      end

      it "メニュー名がない" do
        post.menu_name = ""
        expect(post).to_not be_valid
      end

      it "説明文がない" do
        post.content = ""
        expect(post).to_not be_valid
      end

      it "説明文が400文字以上" do
        post.content = "a"*401
        expect(post).to_not be_valid
      end

      it "アルコールカテゴリーを紐づいていない" do
        post.alc_category_id = ""
        expect(post).to_not be_valid
      end

      it "メニューカテゴリーを紐づいていない" do
        post.menu_category_id = ""
        expect(post).to_not be_valid
      end

    end

  end
end
