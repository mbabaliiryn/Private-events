require 'rails_helper'
require_relative '../support/event_data'
require_relative '../support/login_form'

feature 'Create and attend Events' do
  let(:user) { User.new(username: 'pato', email: 'nyatindopatrick@gmail.com') }
  let(:user2) { User.create!(username: 'nyatindo', email: 'patrickotieno39@gmail.com') }
  let(:event) { Event.new }
  let(:event_data) { EventData.new }
  let(:login) { LoginForm.new }

  before(:each) do
    user.save
    login.visit_page.login_as
  end
  scenario 'Authenticated user creates events' do
    event_data.visit_page(new_event_path).submit
    expect(page.current_path).to eq('/events')
  end

  scenario 'Invite another registered user to an event' do
    user2
    event_data.visit_page(new_event_path).submit
    event_data.visit_page('/events/1/invites').send_invite

    expect(page).to have_no_content('patrickotieno39@gmail.com')
  end
end
