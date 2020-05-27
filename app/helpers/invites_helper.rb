module InvitesHelper
  require 'sendgrid-ruby'
  include SendGrid
  def sgmail(to, title)
    from = SendGrid::Email.new(email: 'invite@privateevents.com')
    to = SendGrid::Email.new(email: to)
    subject = "Invitation To #{title}"
    content = SendGrid::Content.new(type: 'text/plain', value: "You have been invited to attend #{title}.
    Please log in to your account to accept the invitation")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SG_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def uninvited(event, users)
    users - event.attendees.map(&:users).to_a
  end
end
