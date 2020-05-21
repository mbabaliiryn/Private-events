class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :events, foreign_key: :creator_id
  has_many :attendances
  has_many :invitations, through: :user, class_name: "Attendance"
  # has_and_belongs_to_many :attendances, class_name: 'Event'
end
