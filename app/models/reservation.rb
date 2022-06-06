class Reservation < ApplicationRecord
  before_save :date_not_in_past, if: :date

  belongs_to :user
  belongs_to :motorcycle

  validates :motorcycle_id, presence: true, uniqueness: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :city, presence: true

  # check if the date is not in the past
  def date_not_in_past
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
