class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.time = Time.now.strftime('%Y-%m-%dT%H:%M')
    @author_name = current_user.name
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_type, :location, :time)
  end
end
