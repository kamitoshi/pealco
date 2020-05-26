class HomeController < ApplicationController
  before_action :signed_user_redirect

  def top
  end

  def about
  end

  private
  def signed_user_redirect
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
