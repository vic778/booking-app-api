class MotorcycleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :model, :year, :color, :image, :available, :created_at, :updated_at

  has_many :reservations
end
