class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only:[:show, :edit, :update, :destroy]

  def index
    @schedules = current_user.schedules.all.order(start_date: :asc)
  end

  def show
  end

  def new
    @schedule = Schedule.new(start_date: params[:date])
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to schedules_path
    else
      flash.now[:danger] = "スケジュールを登録できません"
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:success] = "スケジュールを編集しました"
      redirect_to schedules_path
    else
      flash.now[:danger] = "スケジュールの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      flash[:danger] = "スケジュールを削除しました"
      redirect_to schedules_path
    else
      render :index
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_date, :user_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def ransack
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(50)
    @post_search = Post.ransack(params[:q])
    @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(25)
  end

end
