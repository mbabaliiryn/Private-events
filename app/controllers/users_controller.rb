class UsersController < ApplicationController
  def index
    @attendee = Attendance.where(attendee_id: current_user.id)
    @attendee = @attendee.map(&:event_id)
    @events = Event.where(id: @attendee)
  end

  def show
    @upcoming_events = Event.upcoming_events.where(creator_id: current_user.id)
    @prev_events = Event.previous_events.where(creator_id: current_user.id)
    render 'events/index'
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
