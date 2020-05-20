module ApplicationHelper
  def navmenu(name, link, userStatus)
    if name == 'logout'
      if userStatus
        return link_to name, link, method: :delete
      else
        return link_to 'login', new_user_session_path
      end
    end
    return link_to name, link if userStatus
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
