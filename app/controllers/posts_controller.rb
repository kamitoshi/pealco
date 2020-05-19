class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :category_index

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :menu_name, :content, :image, :user_id, :alc_category_id, :menu_category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def category_index
    @alc_categories = AlcCategory.all
  end

end
