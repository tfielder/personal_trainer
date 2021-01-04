class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    # @user = current_user
    # @workout = @user.workouts.create(workout_parms)
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    if @workout.save
      redirect_to @workout
    else
      render :new
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update(workout_params)
      redirect_to @workout
    else
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    redirect_to dashboard_path
  end

  private
    def workout_params
      params.require(:workout).permit(:title, :user_id)
    end
end