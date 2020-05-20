class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :follower]

  def index
    @users = User.all
  end

  def follow
  end

  def follower
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :alc_category_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
