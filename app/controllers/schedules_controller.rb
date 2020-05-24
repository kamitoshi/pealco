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
      redirect_to schedules_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
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

end
