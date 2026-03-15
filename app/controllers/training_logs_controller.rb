class TrainingLogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @training_logs = current_user.training_logs.includes(:exercise).order(date: :desc)
  end

  def new
    @training_log = current_user.training_logs.build
    @exercises = current_user.exercises
  end

  def create
    @training_log = current_user.training_logs.build(training_log_params)
    if @training_log.save
      redirect_to training_logs_path, notice: 'Training log created successfully.'
    else
      @exercises = current_user.exercises
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @training_log = current_user.training_logs.find(params[:id])
    @training_log.destroy
    redirect_to training_logs_path, notice: 'Training log deleted successfully.'
  end

  private

  def training_log_params
    params.require(:training_log).permit(:date, :exercise_id, :weight, :reps, :sets, :memo)
  end
end
