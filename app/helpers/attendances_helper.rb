# frozen_string_literal: true

module AttendancesHelper
  def attend_button(event, user)
    post_link = link_to 'Book Now', event_attendances_path(event), method: :post, class: 'book-now'
    view_attendees = link_to 'View Attendees', event_attendances_path(event), class: 'book-now'
    attending = link_to 'Attending', '#', class: 'attending-btn'
    if event.creator_id == user.id
      return view_attendees
      elsif event.attendees.include?(current_user.username)
    # elsif (!event.attendees.empty?) && (event.attendees.to_a.any?{ |e| e.id == user.id})
      return attending
    elsif event.attendees.empty?
      return post_link
    else
      return post_link

    # if creator == user.id
    #   view_attendees
    # elsif !attend.empty?
    #   attend = attend.to_a
    #   attend.each do |i|
    #     if i.user.username.include?(user.username)
    #       return 
    #     elsif attend.any?{ |n| n.attendee.username == user.username}
    #     # elsif i.user.username.include?(user.username)
    #       return view_attendees
    #     else
    #       # return "#{user.username}, #{i.user.username}"
    #       return post_link
    #     end
    #   end
    # else
    #   post_link
    end
  end
end
