class User < ApplicationRecord
    has_secure_password
    has_secure_token :confirmation_token
    
    
    validates :name, 
        format: {with: /\A[a-zA-Z0-9_]{3,20}\z/},
        uniqueness: {case_sensitive: false}
        
    validates :mail, 
        format: {with: /@/},
        uniqueness: {case_sensitive: false}
        
    
    def get_session
        {id: id}
    end
end
