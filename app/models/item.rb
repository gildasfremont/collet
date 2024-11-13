class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :title, presence: true
  
  enum :status, {
    available: 0,    # Disponible
    borrowed: 1,     # Emprunté
    unavailable: 2   # Non disponible
  }, default: :available
  
  # Validation de l'image si elle est présente
  validates :image,
            content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'doit être au format PNG ou JPEG' },
            if: :image_attached?

  private

  def image_attached?
    image.attached?
  end
end
