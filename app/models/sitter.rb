class Sitter < ApplicationRecord
    has_one_attached :image
    has_many :bookings
    has_many :users, through: :bookings
    has_secure_password
    
    validates :gender,inclusion: {in: ["woman", "man", "transgender", "non-binary", "prefer not to respond"]}, presence: true
    validates :age, :rate, presence: true
end