class NameValidator < ActiveModel::Validator
    
    def validate(record)
        if record.name.nil? || record.name.length < 3
            record.errors.add(:name, :too_short, {message: '--> Le titre doit être de 3 caractères minimum'})
        end
        
        if record.content.nil?
            record.errors.add(:content, :too_short, {message: '--> Le contenu ne doit pas être vide'})
        end
    end
    
end