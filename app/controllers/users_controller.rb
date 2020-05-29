class UsersController < ApplicationController
  def show
    @attendee = Attendance.where(attendee_id: current_user.id)
    @attendee = @attendee.map(&:event_id)
    @attended_events = Event.where(id: @attendee)
    @upcoming_events = Event.upcoming_events.where(creator_id: current_user.id)
    @prev_events = Event.previous_events.where(creator_id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email)
  end
end
