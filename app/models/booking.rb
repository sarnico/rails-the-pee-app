class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  validates :date, presence: true
end
