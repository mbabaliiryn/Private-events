class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
    # find_by event_id: params[:id]
  end
  def new 
    @attendances = Attendance.new
  end
  def create 
    @attendances= Attendance.new(user_id: current_user.id)
    @attendances.event_id = params[:id]
    if @attendances.save
      redirect_to event_path
    else
    redirect_to events_path 
    
    end
  end

  private 
  def attendance_params
    # params.require(:attendance).permit(:)
  end
end
