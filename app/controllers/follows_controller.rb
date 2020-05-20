class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    if current_user.follow(@user)
      render :toggle
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    if current_user.unfollow(@user)
      render :toggle
    else
      redirect_to user_path(@user)
    end
  end

end
