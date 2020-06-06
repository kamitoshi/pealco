class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :follower]

  def index
    if params[:alc_category_id]
      @users = User.where(alc_category_id: params[:alc_category_id]).page(params[:page]).per(25)
    else
      @users = User.page(params[:page]).per(25)
    end
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
    unless @user == current_user
      flash[:danger] = "他の人のプロフィールは編集できません"
      redirect_to users_path
    end
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = "編集しました"
        redirect_to user_path(@user)
      else
        render :edit
        flash.now[:danger] = "編集に失敗しました"
      end
    else
      flash[:danger] = "編集に失敗しました"
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
      flash[:danger] = "他の人を退会させることはできません"
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
