class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :motorcycles
  has_many :reservations
end
