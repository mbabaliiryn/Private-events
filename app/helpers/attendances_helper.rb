# frozen_string_literal: true

module AttendancesHelper
  def attend_button(creator, user, attend, _evt)
    post_link = link_to 'Book Now', '/attending', method: :post, class: 'book-now'
    if !attend.empty? && !i.values.include?(creator)
      attend.each do |i|
        if i.values.include?(user)
          return 'Attending'
        else
          return post_link
        end
      end
    elsif creator.username == user.username
      link_to 'View Attendees', event_attendance_index_path, class: 'book-now'
    else
      post_link
    end
  end
end
