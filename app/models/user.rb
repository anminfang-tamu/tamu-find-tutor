class User < ApplicationRecord
    before_save { self.user_email = user_email.downcase }
    has_many :posts
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true, length: { minimum: 6, maximum: 25 }
    validates :user_email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    
    has_secure_password
end
