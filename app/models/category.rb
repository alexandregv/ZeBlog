class Category < ApplicationRecord
    include Slugable
    include Nameable
    
    has_many :posts
end
