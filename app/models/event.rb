class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, class_name: 'Attendance'

  scope :upcoming_events, -> { where('day >= ?', Time.zone.now) }
  scope :previous_events, -> { where('day < ?', Time.zone.now) }
  validates :title, presence: true
  validates :about, presence: true
  validates :location, presence: true
  validates :day, presence: true
end
