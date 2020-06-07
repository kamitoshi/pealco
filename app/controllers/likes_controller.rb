class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :ransack, only:[:index]

  def index
    @user = User.find(params[:user_id])
    @likes = Like.where(user_id: @user.id)
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id)
    @like.save
    render :toggle
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy
    @like = nil
    # redirect_to post_path(@like.post)
    render :toggle
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def ransack
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(50)
    @post_search = Post.ransack(params[:q])
    @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(25)
  end

end
