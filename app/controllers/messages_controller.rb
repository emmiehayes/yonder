class MessagesController < ApplicationController

def create 
    trail = Trail.find(params[:current_user][:trail_id])
    if current_user
      message = "Emmie has invited you to ride #{trail.name} in #{trail.location}!"
      phone = params[:current_user][:phone_number]
      SmsTextMessenger.new(message, phone).call
      redirect_to trail_path(trail)
    end
  end
end