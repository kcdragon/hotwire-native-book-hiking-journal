class NotificationToken < ApplicationRecord
  belongs_to :user

  validates_presence_of :token
  validates_inclusion_of :platform, in: %w[iOS]
end
