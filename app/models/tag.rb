class Tag < ApplicationRecord
    include Nameable

    has_and_belongs_to_many :posts

end
