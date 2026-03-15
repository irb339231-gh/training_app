class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercises = current_user.exercises
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: 'Exercise created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = current_user.exercises.find(params[:id])
    @exercise.destroy
    redirect_to exercises_path, notice: 'Exercise deleted successfully.'
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
