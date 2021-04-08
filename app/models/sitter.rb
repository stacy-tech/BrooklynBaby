class Sitter < ApplicationRecord
    has_one_attached :image
    has_many :bookings
    has_many :users, through: :bookings

    validates :gender,inclusion: {in: ["woman", "man", "transgender", "non-binary", "prefer not to respond"]} :age, :rate, presence: true
end