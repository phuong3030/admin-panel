require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
  config.color = true
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, type: :controller
  config.include AuthenHelper, :type => :request

  Kernel.srand config.seed
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:all) do
    FactoryGirl.reload
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:all) do
    DeferredGarbageCollection.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
    DeferredGarbageCollection.reconsider
  end
end

