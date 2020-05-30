class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :follower]

  def index
    @users = User.page(params[:page]).per(25)
  end

  def follow
    @users = @user.follow_users.page(params[:page]).per(25)
  end

  def follower
    @users = @user.followed_users.page(params[:page]).per(25)
  end

  def show
  end

  def edit
    redirect_to user_path(current_user) unless @user == current_user
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if @user == current_user
      if @user.destroy
        redirect_to root_path
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to user_path(current_user)
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :alc_category_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
