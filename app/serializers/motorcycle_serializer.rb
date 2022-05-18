class MotorcycleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :available

  has_many :reservations
end
