class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :description, presence: true

  validates :year, presence: true
  validates :model, presence: true, uniqueness: true
  validates :color, presence: true
  validates :image, presence: true
end
