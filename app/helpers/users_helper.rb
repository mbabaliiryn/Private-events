module UsersHelper
  def future_events(event)
    event.select { |e| e.day >= Time.new }
  end

  def previous_events(event)
    event.select { |e| e.day < Time.new && !e.attendees.pending.map(&:event_id).include?(e.id) }
  end
end
