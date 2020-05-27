class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendees, through: :events

  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
end
