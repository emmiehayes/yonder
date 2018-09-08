class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.create(activity_params)
    if @activity.save
      flash[:success] = "Activity successfully created."
      redirect_to dashboard_path
    else
      flash[:alert] = "Missing required fields, activity was not created."
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :high, :low, :sky)
  end
end


