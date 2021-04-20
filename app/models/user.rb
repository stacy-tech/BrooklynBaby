class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :image
    has_secure_password
    has_many :bookings
    has_many :sitters, through: :bookings

    validates :name, :email, presence: true, uniqueness: true 
end