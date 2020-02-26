class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :toilets, dependent: :destroy

  has_one_attached :avatar

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
