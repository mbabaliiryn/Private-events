module ApplicationHelper
  def navmenu(user_status)
    if !user_status
      link_to 'login', new_usersession_path
    else
      link_to 'logout', usersession_path(user_status), method: :delete
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

  def current_menu(name, url)
    link_to name, url if current_user
  end

  def register(user)
    return link_to 'Sign Up', new_user_path unless user
  end
end
