require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FoodStore
  class Application < Rails::Application

    # Ensure order of CMS route for application
    config.railties_order = [ :all, ComfortableMexicanSofa::Engine ]

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.template_engine :slim
    end
    
    # Grape API
    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app"]
  end
end

