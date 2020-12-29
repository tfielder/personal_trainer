class User < ApplicationRecord
  has_many :workouts, dependent: :destroy
  has_many :exercises, through: :workouts

  has_secure_password

  validates_presence_of :first_name
  validates :email, presence: true, uniqueness: true
end
