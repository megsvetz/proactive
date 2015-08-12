class ExerciseController < ApplicationController
  before_action :authenticate_user!
  before_action :find_exercise, only: [:edit, :update, :destroy]

  def index
    @exercises = current_user.exercises.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to client_information_path, notice: "Exercise was successfully created."
    else
      flash[:notice] = "Exercise was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to client_information_path, notice: "Exercise was successfully updated."
    else
      flash[:notice] = "Exercise was not updated."
      render action: 'edit'
    end
  end

  def destroy
    @exercise.destroy
    redirect_to client_information_path
  end

  private

  def find_type
    Exercise.type.include?(params[:type]) ? params[:type] : "Exercise"
  end

  def exercise_params
    params.require(find_type.underscore.to_sym).permit(:type, :exercise_description, :sets, :reps. :extra_weight, :weight)
  end

  def find_exercise
    @exercise = Exercise.find_by(id: params[:id])
  end

end
