class WorkoutsController < ApplicationController
  def index
    if current_user && current_user.id
      @workouts = Workout.where(user_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def show
    @workout = Workout.find(params[:id])
    if @workout.user_id == current_user.id
      @workout
    else
      redirect_to dashboard_path
    end
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
    @workout if @workout.user_id == current_user.id
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
    @workout.destroy if @workout.user_id == current_user.id

    redirect_to dashboard_path
  end

  private
    def workout_params
      params.require(:workout).permit(:title, :user_id)
    end
end