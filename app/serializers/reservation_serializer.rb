class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :motorcycle_id, :duration, :price, :city, :date, :user_id, :created_at, :updated_at

  belongs_to :motorcycle
end
