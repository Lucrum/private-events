class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendance
  has_many :attendee, through: :attendance, source: :user

  scope :past, -> { where('time < ?', Date.today) }
  scope :upcoming, -> { where('time > ?', Date.today) }

  validates :event_type, presence: true

  validates :location, presence: true

  validates :time, presence: true
end
