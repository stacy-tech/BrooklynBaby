class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :sitter

    validates :datetime, presence: true
    validates :status, inclusion: {in: ["pending", "confirmed", "denied"]}
end