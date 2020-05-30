require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "ログインしていない状態" do

    before do
      @user = create(:user)
      @other_user = create(:other_user)
    end

    context "各ページのレスポンスが失敗する" do
      it "ユーザー一覧ページ" do
        get users_path
        expect(response).to_not have_http_status(:success)
      end
      it "ユーザー詳細ページ" do
        get user_path(@user)
        expect(response).to_not have_http_status(:success)
      end
      it "ユーザー編集画面" do
        get edit_user_path(@user)
        expect(response).to_not have_http_status(:success)
      end
      it "フォロー一覧画面" do
        get follow_user_path(@user)
        expect(response).to_not have_http_status(:success)
      end
      it "フォロワー一覧画面" do
        get follower_user_path(@user)
        expect(response).to_not have_http_status(:success)
      end
    end

    context "表示に失敗した際、ログインページへ遷移" do
      it "ユーザー一覧ページ" do
        get users_path
        expect(response).to redirect_to new_user_session_path
      end
      it "ユーザー詳細ページ" do
        get user_path(@user)
        expect(response).to redirect_to new_user_session_path
      end
      it "ユーザー編集画面" do
        get edit_user_path(@user)
        expect(response).to redirect_to new_user_session_path
      end
      it "フォロー一覧画面" do
        get follow_user_path(@user)
        expect(response).to redirect_to new_user_session_path
      end
      it "フォロワー一覧画面" do
        get follower_user_path(@user)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインすることができる" do
      it "ログイン" do
        get new_user_session_path
        expect(response).to have_http_status(:success)
        post new_user_session_path, params:{user:{email: @user.email, password: @user.password}}
        expect(response).to redirect_to posts_path
      end
    end

  end

  describe "ログインしている状態" do

    before do
      @user = create(:user)
      @other_user = create(:other_user)
      sign_in (@user)
    end

    context "各ページのレスポンスに成功する" do
      it "ユーザー一覧ページ" do
        get users_path
        expect(response).to have_http_status(:success)
      end
      it "ユーザー詳細ページ" do
        get user_path(@user)
        expect(response).to have_http_status(:success)
      end
      it "ユーザー編集画面" do
        get edit_user_path(@user)
        expect(response).to have_http_status(:success)
      end
      it "フォロー一覧画面" do
        get follow_user_path(@user)
        expect(response).to have_http_status(:success)
      end
      it "フォロワー一覧画面" do
        get follower_user_path(@user)
        expect(response).to have_http_status(:success)
      end
    end

    context "ユーザーを編集する" do
      it "編集後マイページに遷移すること" do
        patch user_path(@user), params:{user:{name: "テスト太郎"}}
        expect(response).to redirect_to user_path(@user)
      end
      it "編集したデータに更新されている" do
        patch user_path(@user), params:{user:{name: "テスト太郎"}}
        @user.reload
        expect(@user.name).to eq "テスト太郎"
      end
      it "編集に失敗した場合、編集ページに残る" do
        patch user_path(@user), params:{user:{name: " "}}
        expect(response).to render_template :edit
      end
      it "他の人の編集画面にいけないこと" do
        get edit_user_path(@other_user)
        expect(response).to_not have_http_status(:success)
      end
      it "他の人の編集画面に行こうとするとマイページに遷移する" do
        get edit_user_path(@other_user)
        expect(response).to redirect_to(user_path(@user))
      end
      it "他の人のデータは編集できないこと" do
        patch user_path(@other_user), params:{user:{name: "テスト太郎"}}
        expect(response).to_not have_http_status(:success)
      end
    end

    context "ユーザーを削除する" do
      it "削除後、トップページに遷移" do
        delete user_path(@user)
        expect(response).to redirect_to root_path
      end
      it "削除に成功している（DBの減少）" do
        delete user_path(@user)
        pending
        expect(response).to change(User, :count).by(-1)
      end
      it "削除に失敗した場合、マイページに戻る" do
        delete user_url(@user)
        expect(response).to redirect_to root_path
      end
    end

  end

end
