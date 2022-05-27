class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
  after_save :set_available

  validates :motorcycle_id, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true

  def set_available
    @motorcycle = Motorcycle.find(self.motorcycle_id)
    @motorcycle.update(available: false)
  end
end
