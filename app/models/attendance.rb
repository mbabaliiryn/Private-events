class Attendance < ApplicationRecord
  # belongs_to :event
  has_many :attendees, foreign_key: :attendee_id,class_name: 'User'
  belongs_to :users, class_name: 'User', foreign_key: 'attendee_id'
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id'

  validates :event_id, presence: true
  validates :attendee_id, presence: true

  scope :attending, -> { where(attending: true) }
  scope :pending, -> { where(attending: false) }
end
