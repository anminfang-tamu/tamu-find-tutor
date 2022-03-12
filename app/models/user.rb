class User < ApplicationRecord
     has_many :posts
     
     validates :username, presence: true, 
                            length: { minimum: 3, maximum: 20 }, 
                            uniqueness: { case_sensitive: false }
                            
    validates :password, presence: true,
                            length: { minimum: 6, maximum: 20 }
end
