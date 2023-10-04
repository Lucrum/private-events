class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where(creator: current_user.id)
  end

end
