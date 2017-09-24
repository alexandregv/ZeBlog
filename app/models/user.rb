class User < ApplicationRecord
    attr_accessor :avatar
    
    has_secure_password
    has_secure_token :confirmation_token
    
    before_save :update_has_avatar
    after_save :upload_avatar
    after_destroy_commit :destroy_avatar
    
  
    validates :name, 
        format: {with: /\A[a-zA-Z0-9_]{3,20}\z/},
        uniqueness: {case_sensitive: false}
        
    validates :mail, 
        format: {with: /@/},
        uniqueness: {case_sensitive: false}
        

    validates :avatar, file: {ext: [:png, :jpg, :jpeg]}
        

    
    def get_session
        {id: id}
    end

    
    
    def avatar_path
        # '/public/users/:id/avatar.jpg'
        File.join(
            Rails.public_path,
            self.class.name.downcase.pluralize,
            id.to_s,
            'avatar.jpg'
        )        
    end
    
    def avatar_url
        # '/public/users/:id/avatar.jpg'
        '/' + [
            self.class.name.downcase.pluralize,
            id.to_s,
            'avatar.jpg'
        ].join('/')        
    end
    
    
    
    private
    
    def update_has_avatar
        # TODO: Repasse à false si avatar = nil
        self.has_avatar = true
    end
    
    def upload_avatar
        path = avatar_path
    
        if avatar.respond_to? :path
            dir = File.dirname(path)
            FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
           
            image = MiniMagick::Image.new(avatar.path) do |b|
                b.resize '150x150^'
                b.gravity 'Center'
                b.crop '150x150+0+0'
            end
            
            image.format 'jpg'
            image.write path
        end
    end
    
    def destroy_avatar
        dir = File.dirname(avatar_path)
        p FileUtils.rm_r(dir) if Dir.exist?(dir)
    end
    
end
