class Toilet < ApplicationRecord

  PERIOD_TIME = 0.25

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :image, presence: true
  validate :time_integrity

  def time_integrity
    Time.parse(max_booking_time) rescue errors.add(:max_booking_time, "not valid")
    Time.parse(min_booking_time) rescue errors.add(:min_booking_time, "not valid")
  end

  def available_booking_periods
    periods=[]
    setting_time = format_time(min_booking_time)
    while setting_time < format_time(max_booking_time) do
      setting_time += PERIOD_TIME
      periods << setting_time
    end
    return periods
  end

  def format_time(time)
    time = time.split(":")[0].to_f + (time.split(":")[1].to_f/60)
  end

end
