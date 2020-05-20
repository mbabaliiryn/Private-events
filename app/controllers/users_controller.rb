class UsersController < ApplicationController
    def show 
        @events = Event.where(creator_id: current_user.id)
        render "events/index"
    end
end