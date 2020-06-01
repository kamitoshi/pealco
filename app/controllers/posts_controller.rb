class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :category_index

  def index
    if params[:alc_category_id]
      @posts = Post.where(alc_category_id: params[:alc_category_id]).order(created_at: :desc).page(params[:page]).per(25)
    elsif params[:user_id]
      @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(25)
    else
      @posts = Post.page(params[:page]).order(created_at: :desc).per(25)
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
  end

  def new
    @post = Post.new(alc_category_id: params[:alc_category_id])
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
    redirect_to posts_path unless @post.user == current_user
  end

  def update
    if @post.user == current_user
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        redirect_to posts_path
      else
        redirect_to posts_path
      end
    else
      redirect_to posts_path
    end
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
