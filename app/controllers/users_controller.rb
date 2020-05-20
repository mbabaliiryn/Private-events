class UsersController < ApplicationController
    def show 
        @events = Event.where(user_id: current_user.id)
        render "events/index"
    end
end