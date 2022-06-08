class MotorcycleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :model, :year, :color, :image, :available, :created_at, :updated_at

  belongs_to :user
  has_many :reservations
end
