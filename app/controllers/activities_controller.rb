class ActivitiesController < ApplicationController
helper_method :activity

  def activity
    #not to be called in view, used because the new, show, edit methods all kick off this helper method
    @memoized_activity ||= Activity.find_or_initialize_by(id: params[:id])
  end

  def create
    activity = current_user.activities.create(activity_params)
    if activity.save
      flash[:success] = "Activity successfully created."
      redirect_to dashboard_path
    else
      flash[:alert] = "Missing required fields, activity was not created."
      render :new
    end
  end

  def update 
    activity = Activity.find(params[:id])
    activity.update(activity_params)
    if activity.save
      flash[:successs] = "Activity successfully updated."
      redirect_to user_activity_path(current_user, activity)
    else
      flash[:alert] = "Missing required fields, activity was not updated."
      render :edit
    end
  end

  def destroy 
    activity = Activity.destroy(params[:id])
    flash[:success] = "Successfully deleted #{activity.title}"
    redirect_to dashboard_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :high, :low, :sky)
  end
end


