module EventsHelper
    def attending_note(event, user)
        post_link ='Book Now'
        view_attendees = nil
        attending = 'Attending'
        if user && event.creator_id == user.id
          view_attendees
        elsif !event.attendees.empty? && (event.attendees.to_a.any? { |e| e.user == user })
          attending
        elsif event.attendees.empty?
          post_link
        else
          post_link
        end
      end
end
