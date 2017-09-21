class Post < ApplicationRecord
    include Slugable
    include Nameable
    
    belongs_to :category, counter_cache: true
    has_and_belongs_to_many :tags
    
    default_scope { includes(:category) } # Eviter d'avoir 1 requete par article
    scope :published, -> { where(published: true) }
    scope :new_to_old, -> { order(created_at: :desc) }
    
    validates :content, length: {minimum: 20, message: '--> Minimum 20 caractères'}, uniqueness: true
end
