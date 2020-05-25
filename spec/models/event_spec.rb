require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'event model validation' do
    it 'it must have a title' do
      events = Event.new(about: "it's a pandemic disease", location: 'EA conference hall',
                         day: '2020-05-25 15:39:19.35599 +0300').save
      expect(events).to eq(false)
    end
    it 'must have a description' do
      events = Event.new(title: 'COVID', location: 'EA conference hall',
                         day: '2020-05-25 15:39:19.35599 +0300 ').save
      expect(events).to eq(false)
    end
    it 'must have a location' do
      events = Event.new(title: 'COVID', about: "it's a pandemic disease", day: '2020-05-25 15:39:19.35599 +0300 ').save
      expect(events).to eq(false)
    end
    it 'must have a date' do
      events = Event.new(title: 'COVID', about: "it's a pandemic disease", location: 'EA conference hall').save
      expect(events).to eq(false)
    end
  end
end
