class HomeController < ApplicationController
  layout "no_header", only:[:top]

  before_action :signed_user_redirect
  before_action :ransack, only:[:about]

  def top
  end

  def about
  end

  private
  def signed_user_redirect
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def ransack
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(50)
    @post_search = Post.ransack(params[:q])
    @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(25)
  end
end
