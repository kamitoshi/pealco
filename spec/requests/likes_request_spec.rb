require 'rails_helper'

RSpec.describe "Likes", type: :request do

  describe "お気に入り関係" do
    
    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}
    let(:alc_category) {create(:alc_category)}
    let(:menu_category) {create(:menu_category)}
    let(:post) {create(:post)}

    before do
      sign_in(user)
    end

    context "投稿詳細ページ" do
      it "お気に入りに追加するボタンがある" do
        visit post_path(post)
        expect(page).to have_content "お気に入りに追加する"
      end
      it "お気に入りしている投稿のボタン" do
        create(:like, user_id: user.id, post_id: post.id)
        visit post_path(post)
        expect(page).to have_content "お気に入りから外す"
      end
    end
    
  end

end
