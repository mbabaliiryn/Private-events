require 'rails_helper'
require_relative '../support/signup_form'

feature 'Signup Page' do
  let(:user) { User.new(username: 'pato', email: 'nyatindopatrick@gmail.com') }
  let(:user2) { User.new(username: 'pato') }
  let(:signup) { SignupForm.new }
  scenario 'Redirect to events page on success signup' do
    signup.visit_page.register(user)
    expect(page.current_path).to eq('/events')
  end

  scenario 'Remain on User path on failed signup' do
    signup.visit_page.register(user2)
    expect(page.current_path).to eq('/users')
  end
end
