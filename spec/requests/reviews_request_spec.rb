require 'rails_helper'

RSpec.describe "Reviews", type: :request do

  let(:user) {create(:user)}
  let(:other_user) {create(:other_user)}
  let(:alc_category) {create(:alc_category)}
  let(:menu_category) {create(:menu_category)}
  let(:post) {create(:post)}
  let(:other_post) {create(:other_post)}
  let(:review) {create(:review)}

  describe "ログインしていない状態" do

    context "各ページにいけない" do
      it "新規レビュー画面" do
        get new_post_review_path(post)
        expect(response).to_not have_http_status(:success)
      end
      it "レビュー編集画面" do
        get edit_post_review_path(post_id: post.id, id: review.id)
        expect(response).to_not have_http_status(:success)
      end
    end

    context "ログイン画面にリダイレクトする" do
      it "新規レビュー画面" do
        get new_post_review_path(post)
        expect(response).to redirect_to new_user_session_path
      end
      it "レビュー編集画面" do
        get edit_post_review_path(post_id: post.id, id: review.id)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "ログインしている状態" do
    before do
      @user = user
      sign_in (@user)
    end
    context "各ページの表示に成功する" do
      it "新規レビュー画面" do
        get new_post_review_path(post)
        expect(response).to have_http_status(:success)
      end
      it "レビュー編集画面" do
        @post = post
        @review = review
        @review.update(user_id: @user.id, post_id: @post.id)
        get edit_post_review_path(post_id: @post.id, id: @review.id)
        expect(response).to have_http_status(:success)
      end
    end

    context "各操作ができる" do
      it "レビューの編集が反映される" do
        @post = post
        @review = review
        @review.update(user_id: @user.id, post_id: @post.id)
        get edit_post_review_path(post_id: @post.id, id: @review.id)
        patch post_review_path(post_id: @post.id, id: @review.id), params:{review:{rating: 2}}
        @review.reload
        expect(@review.rating).to eq 2
      end
    end
  end

end