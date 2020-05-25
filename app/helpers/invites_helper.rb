module InvitesHelper
    def uninvited(event, users)
        arr = []
        event.attendees.each do |u|
            arr = users.select {|a| a[:id] != u.users[:id] }
        end
        arr
    end
end
