module Slugable
    extend ActiveSupport::Concern
    
    
    included do
        before_validation :format_slug, on: [:create, :update]
        validates :slug, format: {with: /\A[a-z0-9\-]+\z/, message: '--> Format URL invalide'}, uniqueness: true
        
        private
        def format_slug
            self.slug = self.name if self.slug.empty?
            self.slug = self.slug.parameterize
        end
    end
    
end