class Reservation < ApplicationRecord
  has_many_attached :image
  
  belongs_to :user
  belongs_to :room
end
