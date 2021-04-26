class User < ApplicationRecord
    has_secure_password
    has_one_attached :icon
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :rooms
    has_many :reservations, dependent: :destroy
end
