class LoginForm
  include Capybara::DSL

  def visit_page
    visit('/usersessions/new')
    self
  end

  def login_as
    fill_in('username', with: 'pato')
    click_on('Login')
    self
  end
end
