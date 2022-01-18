class Competition < ApplicationRecord
  has_many :games
  has_many :teams

  validates :name, presence: true
end
