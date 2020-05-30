require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "ログインしていない状態のテスト" do

    context "トップページ" do
      it "レスポンスが成功" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context "アバウトページ" do
      it "レスポンスが成功" do
        get about_path
        expect(response).to have_http_status(:success)
      end
    end

  end

  describe "ログインしている状態のテスト" do

    before do
      @user = create(:user)
      sign_in @user
    end

    context "トップページ" do
      it "レスポンスが失敗" do
        get root_path
        expect(response).to_not have_http_status(:success)
      end
      it "マイページに遷移" do
        get root_path
        expect(response).to redirect_to posts_path
      end
    end

    context "アバウトページ" do
      it "レスポンスが失敗" do
        get about_path
        expect(response).to_not have_http_status(:success)
      end
      it "マイページに遷移" do
        get about_path
        expect(response).to redirect_to posts_path
      end
    end

  end

end
