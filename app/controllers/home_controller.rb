class HomeController < ApplicationController
  layout "no_header", only:[:top]

  before_action :signed_user_redirect
  skip_before_action :ransack, only:[:top]

  def top
    @recommend_posts = Post.all.shuffle.take(3)
  end

  def about
  end

  private
  def signed_user_redirect
    if user_signed_in?
      redirect_to posts_path
    end
  end

end
