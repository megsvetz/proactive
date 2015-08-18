class GoalController < ApplicationController
  before_action :authenticate_user!
  before_action :find_goal, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to client_information_path, notice: "Goal was successfully created."
    else
      flash[:notice] = "Goal was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to client_information_path, notice: "Goal was successfully updated."
    else
      flash[:notice] = "Goal was not updated."
      render action: 'edit'
  end

  def destroy
    @goal.destroy
    redirect to client_information_path
  end

  private

  def authenticate_user
    if @goal.user_id != current_user.id
      redirect_to root_path
    end
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
  end

  def goal_params
    params.require(:goal).permit(:goal, :diet_goal, :completed, :completed_date, :exercised, :streak)
  end

end
