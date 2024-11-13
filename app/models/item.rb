class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :title, presence: true
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg']
  
  enum status: {
    available: 0,    # Disponible
    borrowed: 1,     # Emprunté
    unavailable: 2   # Non disponible
  }
end
