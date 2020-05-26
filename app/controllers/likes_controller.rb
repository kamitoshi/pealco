class LikesController < ApplicationController
  before_action :authenticate_user!

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

end
