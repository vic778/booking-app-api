class Motorcycle < ApplicationRecord
  after_save :set_available

  belongs_to :user
  has_many :reservations
  mount_uploader :image, ImageUploader

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  validates :year, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :image, presence: true

  def set_available
    self.update(available: false)
  end
end
