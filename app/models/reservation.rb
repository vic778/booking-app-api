class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :motorcycle_id, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true
end
