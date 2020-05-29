module UsersHelper
  def future_events(event)
    event.select { |e| e.day >= Time.new }
  end

  def previous_events(event)
    event.select { |e| e.day < Time.new }
  end
end
