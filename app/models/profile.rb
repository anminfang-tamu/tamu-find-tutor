class Profile < ApplicationRecord
    belongs_to :user
    
        
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :full_name, length: { minimum: 3, maximum: 20 }
    validates :display_name, length: { minimum: 6, maximum: 20 }
    validates :phone, numericality:true, length: { minimum: 10, maximum: 15 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
