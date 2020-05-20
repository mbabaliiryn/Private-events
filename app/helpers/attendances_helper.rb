# frozen_string_literal: true

module AttendancesHelper
  def attend_button(event, user)
    post_link = link_to 'Book Now', event_attendances_path(event), method: :post, class: 'book-now'
    view_attendees = link_to 'View Attendees', event_attendances_path(event), class: 'book-now'
    attending = link_to 'Attending', '#', class: 'attending-btn'
    if event.creator_id == user.id
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
