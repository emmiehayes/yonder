 class UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:activity_preference)
  end
end