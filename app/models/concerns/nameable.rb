module Nameable
    extend ActiveSupport::Concern
    
    
    included do
        validates :name, length: {in: 3..200, message: '--> Entre 3 et 200 caractères'}, uniqueness: true
    end
    
end