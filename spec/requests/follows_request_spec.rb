require 'rails_helper'

RSpec.describe "Follows", type: :request do

  describe "フォロー関係" do
    
    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}
    let(:alc_category) {create(:alc_category)}
    let(:menu_category) {create(:menu_category)}
    let(:post) {create(:post)}

    before do
      sign_in(user)
    end

    context "自分の詳細ページ" do
      it "フォローボタンがない" do
        visit user_path(user)
        expect(page).to_not have_content "フォローする"
      end
    end
    
    context "他人の詳細ページ" do
      it "フォローボタンがある" do
        visit user_path(other_user)
        expect(page).to have_content "フォローする"
      end
      it "既にフォローしている人のボタン" do
        create(:follow, user_id: user.id, follow_id: other_user.id)
        visit user_path(other_user)
        expect(page).to have_content "フォローをやめる"
      end
    end

  end

end
