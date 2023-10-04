class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @author_name = current_user.name
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_type, :location, :time)
  end
end
