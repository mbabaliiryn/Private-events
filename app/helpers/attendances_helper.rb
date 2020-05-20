# frozen_string_literal: true

module AttendancesHelper
  def attend_button(creator, user, attend, evt)
    post_link = link_to 'Book Now', event_attendances_path(evt), method: :post, class: 'book-now'
    view_attendees = link_to 'View Attendees', event_attendances_path(evt), class: 'book-now'
    if creator == user.id
      view_attendees
    elsif !attend.empty?
      attend = attend.to_a
      attend.each do |i|
        if i.attendee.username.include?(user.username)
          return link_to 'Attending', '#', class: 'attending-btn'
        elsif user.id == i.attendee.id
          return view_attendees
        else
          return post_link
        end
      end
    else
      post_link
    end
  end
end
