module ApplicationHelper
  def navmenu(name, link, userStatus)
      if !userStatus
        return link_to name, usersession_path(userStatus), method: :delete
      else
        return link_to 'login', new_usersession_path
      end
    end
  

  def warnings(msg)
    if msg.include?('notice')
      'is-warning'
    else
      'is-danger'
    end
  end

  def footer(user)
    if user
      render 'layouts/footer'
    else
      ''
    end
  end
end
