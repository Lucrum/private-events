class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where(creator: current_user.id)
    @attendances = current_user.attendance.eager_load(:event).limit(10)
  end
end
