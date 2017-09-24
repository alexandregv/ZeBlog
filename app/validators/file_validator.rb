class FileValidator < ActiveModel::EachValidator
    
    def validate_each(record, attribute, value)
        if value
            unless value.respond_to?(:path) && options[:ext].include?(File.extname(value.path).delete('.').downcase.to_sym)
                record.errors[attribute] << (options[:message] || "is not a valid file (#{options[:ext].join(', ')})")
            end
        end
    end
    
end