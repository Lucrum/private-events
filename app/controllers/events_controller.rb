class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @upcoming_events = Event.upcoming.eager_load(:attendee)
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @author_name = @event.creator.name
  end

  def new
    @event = Event.new
    @event.time = Time.now.strftime('%Y-%m-%dT%H:%M')
    @author_name = current_user.name
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: unprocessable_entity
    end
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to users_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_type, :location, :time)
  end
end
