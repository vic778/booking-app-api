class Motorcycle < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :description, presence: true

  validates :year, presence: true
  validates :model, presence: true
  validates :color, presence: true
end
