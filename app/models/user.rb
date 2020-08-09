class User < ApplicationRecord
  has_secure_password

  #validates :first_name, presence: true  # using first_name_required at Line No-13
  validates :last_name, presence: true, length: { minimum: 10 }
  validates :age, presence: true, numericality: true
  validates :email, presence: true, length: { in: 5..30 }
  validates :password, presence: true, length: { in: 5..10 }
  validates :rating, numericality: true

# can add custom validation failure message
  validate :first_name_required
  def first_name_required
    if not first_name.present?
      errors.add(:first_name, "is required")
    end  
  end  
end
