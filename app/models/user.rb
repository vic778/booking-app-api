class User < ApplicationRecord
  has_many :motorcycles, dependent: :destroy
  has_many :reservations, dependent: :destroy

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
