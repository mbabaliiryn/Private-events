class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, class_name: 'Attendance'

  scope :upcoming_events, -> { where('day >= ?', Time.zone.now) }
  scope :previous_events, -> { where('day < ?', Time.zone.now) }
end
