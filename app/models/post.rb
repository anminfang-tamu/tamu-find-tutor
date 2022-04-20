class Post < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true
    validates :tutor_area, presence: true
    validates :schedule, presence: true
    validates :description, presence: true
    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

    def self.search(pattern)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
          where('description LIKE ?', "%#{pattern}%")
        end
    end
end
