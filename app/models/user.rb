class User < ApplicationRecord
    has_one_attached :image
    has_secure_password
    has_many :bookings
    has_many :sitters, through: :bookings

    validates :name, :email, presence: true, uniqueness: true 
end