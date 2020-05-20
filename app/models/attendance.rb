class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :attendee, foreign_key: "attendee_id", class_name: "User"
end
