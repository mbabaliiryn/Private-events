module AttendancesHelper
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def attend_button(event, user)
    post_link = link_to 'Accept Invitation', event_attendance_path(current_user), method: :put, class: 'book-now'
    view_attendees = link_to "View Attendees(#{event.attendees.attending.size})",
                             event_attendances_path(event), class: 'book-now'
    attending = link_to 'Attending', '#', class: 'attending-btn'
    if event.creator_id == user.id
      view_attendees
    elsif !event.attendees.empty? && (event.attendees.attending.to_a.any? { |e| e.users == user })
      attending
    elsif !event.attendees.empty? && (event.attendees.pending.to_a.any? { |e| e.users == user })
      post_link
    elsif event.attendees.empty? || event.attendees.to_a.none? { |e| e.users == user }
      ' '
    end
  end
  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
