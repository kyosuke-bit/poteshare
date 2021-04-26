class Room < ApplicationRecord
    has_one_attached :image
    
    validates :room_name, presence: true
    validates :room_name, length: { maximum: 30 }, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true
    validates :adress, presence: true
    validates :image, presence: true
    
    belongs_to :user
    has_many :reservations
    
    scope :recent, -> { order(created_at: :desc) }
    
end
