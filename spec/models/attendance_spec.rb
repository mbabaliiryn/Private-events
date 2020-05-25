require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'validates attendee_id and event_id' do
    it 'must check the attendee id' do
      attendance = Attendance.new(event_id: 1).save

      expect(attendance).to eq(false)
    end
    it 'must check the  event id' do
      attendance = Attendance.new(attendee_id: 1).save
      expect(attendance).to eq(false)
    end
  end
end
