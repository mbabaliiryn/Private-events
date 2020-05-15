class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  
  end
  def create
    @events = Event.new(event_params)
    @events.user_id = current_user.id
    if @events.save
      redirect_to events_path
    else
      render :new
    end
  
  end

  def show
    @events = Event.all
    render :index

  
  end

  private
  def event_params
    params.require(:event).permit(:title,:day,:time,:about)
  end
end
