# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
  end

  def new
    @attendances = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendances = @event.attendees.create(attendee_id: current_user.id)
    if @attendances.save
      redirect_to event_path(@event)
    else
      redirect_to events_path

    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:id)
  end
end
