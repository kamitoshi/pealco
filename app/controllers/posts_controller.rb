class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :category_index
  before_action :ransack, only:[:show, :new, :edit]

  def index
    if params[:alc_category_id]
      @post_search = Post.where(alc_category_id: params[:alc_category_id]).ransack(params[:q])
      @posts = @post_search.result.order(created_at: :desc).page(params[:page]).per(25)
    elsif params[:user_id]
      @post_search = Post.where(user_id: params[:user_id]).ransack(params[:q])
      @posts = @post_search.result.order(created_at: :desc).page(params[:page]).per(25)
    else
      @post_search = Post.ransack(params[:q])
      @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(25)
    end
    @recommend_posts = Post.where(alc_category_id: current_user.alc_category_id).where.not(user_id: current_user.id).shuffle.take(3)
    @recommend_users = User.where(alc_category_id: current_user.alc_category_id).where.not(id: current_user.id).shuffle.take(3)
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(50)
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @reviews = Review.where(post_id: @post.id).order(created_at: :desc)
  end

  def new
    @post = Post.new(alc_category_id: params[:alc_category_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to posts_path
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    unless @post.user == current_user
      flash[:danger] = "他の人の投稿を編集することはできません"
      redirect_to posts_path
    end
  end

  def update
    if @post.user == current_user
      if @post.update(post_params)
        flash[:success] = "投稿を編集しました"
        redirect_to post_path(@post)
      else
        flash.now[:danger] = "投稿を編集できませんでした"
        render :edit
      end
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:success] = "投稿を削除しました"
        redirect_to posts_path
      else
        flash[:danger] = "削除できていません"
        redirect_to posts_path
      end
    else
      flash[:danger] = "他の人の投稿を削除することはできません"
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

  def ransack
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(50)
    @post_search = Post.ransack(params[:q])
    @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(25)
  end

end
