module EventsHelper
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def attending_note(event, user)
    post_link = 'Accept Invitation'
    view_attendees = nil
    attending = 'Attending'
    check_empty = event.attendees.empty?
    user_exists = event.attendees.attending.to_a.any? { |e| e.users == user }
    invited = event.attendees.pending.to_a.any? { |e| e.users == user }

    if user && event.creator_id == user.id
      'view attendees'
    elsif !check_empty && user_exists
      attending
    elsif !check_empty && invited
      post_link
    elsif check_empty || !user
      view_attendees
    end
  end

  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def drop_menu(form)
    time = ['1 AM', '2 AM', '3 AM', '4 AM', '5 AM', '6 AM', '7 AM', '8 AM', '9 AM',
            '10 AM', '11 AM', '12 PM', '1 PM', '2 PM', '3 PM', '4 PM', '5 PM',
            '6 PM', '7 PM', '8 PM', '9 PM', '10 PM', '11 PM', '12 AM']
    form.select :time, options_for_select(time.collect { |u| u })
  end

  def invite(event)
    attendee = event.attendees.attending.to_a.any? { |e| e.users == current_user }
    event.creator_id == current_user.id || attendee
  end
end
