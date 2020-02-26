class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
