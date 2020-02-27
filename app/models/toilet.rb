class Toilet < ApplicationRecord

  PERIOD_TIME = 15.minutes

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true


  def available_booking_periods
    periods=[]
    setting_time = min_booking_time
    while setting_time < max_booking_time do
      setting_time += PERIOD_TIME
      periods << setting_time
    end
    return periods
  end


end
