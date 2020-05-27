require 'rails_helper'
require_relative '../support/login_form'

feature 'User Login' do
  let(:user) { User.new(username: 'pato', email: 'nyatindopatrick@gmail.com') }
  let(:login) { LoginForm.new }
  scenario 'User logs is and is redirected to events page' do
    user.save
    login.visit_page.login_as
    expect(page.current_path).to eq('/events')
  end

  scenario 'Redirect to sessions path is the user does not exist' do
    login.visit_page.login_as
    expect(page.current_path).to eq('/usersessions')
  end
end
