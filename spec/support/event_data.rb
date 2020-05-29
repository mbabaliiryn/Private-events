class EventData
  include Capybara::DSL
  def visit_page(path)
    visit(path)
    self
  end

  def submit
    fill_in('title', with: 'Ruby')
    fill_in('about', with: 'sometext')
    fill_in('day', with: '2020-05-25 15:39:19.35599 +0300')
    fill_in('location', with: 'LakeHub')

    click_on('Post Event')
    self
  end

  def send_invite
    click_on('Invite')
    self
  end
end
