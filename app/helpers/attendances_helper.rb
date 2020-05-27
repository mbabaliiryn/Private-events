module AttendancesHelper
  # rubocop:disable Metrics/CyclomaticComplexity
  def attend_button(event, user)
    post_link = link_to 'Accept Invitation', event_attendance_path(event), method: :patch, class: 'book-now'
    view_attendees = link_to "View Attendees(#{event.attendees.attending.size})",
                             event_attendances_path(event), class: 'book-now'
    attending = link_to 'Attending', '#', class: 'attending-btn'
    case event
    when ->(h) { h.creator_id == user.id }
      view_attendees
    when ->(h) { !h.attendees.empty? && (h.attendees.attending.to_a.any? { |e| e.users == user }) }
      attending
    when ->(h) { !h..attendees.empty? && (h.attendees.pending.to_a.any? { |e| e.users == user }) }
      post_link
    when ->(h) { h.attendees.empty? || h.attendees.to_a.none? { |e| e.users == user } }
      nil
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
