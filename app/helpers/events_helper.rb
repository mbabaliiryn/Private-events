module EventsHelper
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def attending_note(event, user)
    post_link = 'Accept Invitation'
    view_attendees = nil
    attending = 'Attending'
    check_empty = event.attendees.empty?
    user_exists = event.attendees.attending.to_a.any? { |e| e.users == user }
    invited = event.attendees.pending.to_a.any? { |e| e.users == user }

    case user
    when ->(u) { u && u.id == event.creator_id }
      'view attendees'
    when ->(_u) { !check_empty && user_exists && event.day < Time.now }
      'Attended'
    when ->(_u) { !check_empty && user_exists }
      attending
    when ->(_u) { !check_empty && invited && event.day < Time.now }
      'Invitation Expired'
    when ->(_u) { !check_empty && invited }
      post_link
    when ->(u) { check_empty || !u }
      view_attendees
    end
  end

  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def invite(event)
    attendee = event.attendees.attending.to_a.any? { |e| e.users == current_user }
    (event.creator_id == current_user.id || attendee) && event.day > Time.now
  end

  def show_item(item)
    item ? '' : 'display: none !important'
  end
end
