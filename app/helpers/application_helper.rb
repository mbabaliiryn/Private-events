# frozen_string_literal: true

module ApplicationHelper
  def navmenu(userStatus)
    if !userStatus
      link_to 'login', new_usersession_path
    else
      link_to 'logout', usersession_path(userStatus), method: :delete
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
end
