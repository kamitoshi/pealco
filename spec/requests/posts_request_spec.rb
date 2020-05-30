require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "ログインしていない状態" do

    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}
    let(:alc_category) {create(:alc_category)}
    let(:menu_category) {create(:menu_category)}
    let(:post) {create(:post)}
    let(:other_post) {create(:other_post)}

    context "各ページが表示されない" do
      it "投稿一覧画面" do
        get posts_path
        expect(response).to redirect_to new_user_session_path
      end
      it "投稿詳細画面" do
        get post_path(post)
        expect(response).to redirect_to new_user_session_path
      end
      it "新規投稿画面" do
        get new_post_path
        expect(response).to redirect_to new_user_session_path
      end
      it "投稿編集画面" do
        get edit_post_path(post)
        expect(response).to redirect_to new_user_session_path
      end
    end
    context "処理ができない" do
      it "投稿編集" do
        get edit_post_path(post)
        patch post_path(post), params:{post:{title:"test"}}
        expect(response).to redirect_to new_user_session_path
      end
      it "投稿削除" do
        delete post_path(post)
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

  describe "ログインしている状態" do
    
    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}
    let(:alc_category) {create(:alc_category)}
    let(:menu_category) {create(:menu_category)}

    before do
      sign_in(user)
      @post = create(:post, user_id: user.id)
    end

    context "各ページの表示" do
      it "投稿一覧ページ" do
        user = create(:post)
        get posts_path
        expect(response).to render_template :index
      end
      it "投稿詳細ページ" do
        get post_path(@post)
        expect(response).to render_template :show
      end
      it "新規投稿ページ" do
        get new_post_path
        expect(response).to render_template :new
      end
      it "投稿編集ページ" do
        get edit_post_path(@post)
        expect(response).to render_template :edit
      end
    end

    context "自分の投稿への処理" do
      it "編集" do
        patch post_path(@post), params:{post:{title: "test"}}
        @post.reload
        expect(response).to redirect_to post_path(@post)
      end
      it "削除" do
        delete post_path(@post)
        @post.destroy
        pending
        expect(response).to change(Post, :count).by(-1)
      end
    end
    context "他人の投稿への処理" do

      before do
        @other_post = create(:post, user_id: other_user.id)
      end

      it "投稿編集画面にはいけない" do
        get edit_post_path(@other_post)
        expect(response).to redirect_to posts_path
      end
      it "編集できない" do
        patch post_path(@other_post), params:{post:{title: "test"}}
        @other_post.reload
        expect(response).to redirect_to posts_path
      end
    end

  end

end
