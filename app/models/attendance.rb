class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, foreign_key: 'attendee_id', class_name: 'User', dependent: :destroy
  belongs_to :users, class_name: 'User', foreign_key: 'attendee_id'
  belongs_to :invited_events, class_name: 'Event', foreign_key: 'event_id'

  validates :event_id, presence: true
  validates :attendee_id, presence: true

  scope :attending, -> { where(attending: true) }
  scope :pending, -> { where(attending: false) }
end
