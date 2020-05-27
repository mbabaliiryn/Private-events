# rubocop:disable Layout/Tab
class SignupForm
  include Capybara::DSL
  def visit_page
    visit('/users/new')
    self
  end

  def register(user)
    fill_in 'username',	with: user.username
    fill_in 'email', with: user.email
    click_on('Register')
    self
  end
end
# rubocop:enable Layout/Tab