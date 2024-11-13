class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation email uniquement
  validates :email, presence: true, uniqueness: true
  
  # Génère un mot de passe aléatoire pour satisfaire devise
  before_validation :set_random_password, on: :create
  
  private
  
  def set_random_password
    self.password = SecureRandom.hex(16) if password.blank?
  end
end
