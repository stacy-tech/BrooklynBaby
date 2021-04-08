class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :sitter

    validates :availability, :time, :date, presence: true
    validates :status, inclusion: {in: ["pending", "confirmed", "denied"]}
end