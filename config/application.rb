require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZeBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    #config.autoload_paths << "#{Rails.root}/app/validators"
    
    config.middleware.use Rack::TempfileReaper
    
    config.site = {
      name: 'ZeBlog'
    }
    
    config.generators do |g|
      g.assets            false
      g.helper            false
      g.test_framework    false
      g.jbuilder          false
    end
    
  end
end
