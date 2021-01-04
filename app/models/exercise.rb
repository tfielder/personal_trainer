class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :setlists, dependent: :destroy
end
