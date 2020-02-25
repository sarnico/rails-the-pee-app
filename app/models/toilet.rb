class Toilet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
