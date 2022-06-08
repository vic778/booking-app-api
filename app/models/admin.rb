class Admin < ApplicationRecord
  belongs_to :user
  has_many :motorcycles
end
