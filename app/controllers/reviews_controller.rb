class ReviewsController < ApplicationController
  before_action :set_review, only:[:show, :edit, :update, :destroy]
  before_action :ransack
  def index
  end

  def show
  end

  def new
    rev = Review.find_by(post_id: params[:post_id], user_id: current_user.id)
    if rev.nil?
      @review = Review.new
    else
      redirect_to edit_post_review_path(params[:post_id], rev.id)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.post_id = params[:post_id]
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to post_path(@review.post)
    else
      flash.now[:danger] = "レビューできませんでした"
      render :new
    end
  end

  def edit

  end

  def update
    if @review.user == current_user
      if @review.update(review_params)
        flash[:success] = "レビューを編集しました"
        redirect_to post_path(@review.post)
      else
        flash.now[:danger] = "レビューの編集に失敗しました"
        redirect_to post_path(@review.post)
      end
    else
      flash[:danger] = "他の人のレビューの編集はできません"
      redirect_to post_path(@review.post)
    end
  end

  def destroy
    post = @review.post
    if @review.user == current_user
      if @review.destroy
        flash[:success] = "レビューを削除しました"
        redirect_to post_path(post)
      else
        flash[:danger] = "削除に失敗しました"
        redirect_to post_path(post)
      end
    else
      flash[:danger] = "他の人のレビューは削除できません"
      redirect_to posts_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :post_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
