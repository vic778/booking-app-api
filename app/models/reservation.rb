class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :duration, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true
end
