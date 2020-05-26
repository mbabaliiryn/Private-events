module InvitesHelper
  def uninvited(event, users)
    users - event.attendees.map(&:users).to_a
  end
end
