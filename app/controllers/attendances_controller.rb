class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @attendances = Attendance.where(user_id: current_user.id)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_back(fallback_location: root_path)
  end

  def join
    event = Event.find(params[:attendance_id])

    # ensure user doesn't already have a ticket
    return if event.attendee.include?(current_user)

    @ticket = Attendance.new
    @ticket.event = event
    @ticket.user = current_user

    flash[:notice] = 'Unable to join event' unless @ticket.save

    redirect_to events_path
  end
end
