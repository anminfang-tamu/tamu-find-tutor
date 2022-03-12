class Profile < ApplicationRecord
    belongs_to :user
    
    validates :full_name, length: { minimum: 3, maximum: 20 }
    validates :display_name, length: { minimum: 6, maximum: 20 }
    validates :phone, numericality:true, length: { minimum: 10, maximum: 15 }
end
