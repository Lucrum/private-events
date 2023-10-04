class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :event_type, presence: true

  validates :location, presence: true

  validates :time, presence: true

  # validate :not_in_the_past

  # def not_in_the_past
  #   return unless Date.today > :time

  #   errors.add(:time, "can't take place in the past")
  # end
end
