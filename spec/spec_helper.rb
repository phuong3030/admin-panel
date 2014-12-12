require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.expect_with :rspec

    config.mock_with :rspec

    config.filter_run :focus
    config.run_all_when_everything_filtered = true
    config.use_transactional_fixtures = false

    config.order = :random

    Kernel.srand config.seed

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
end
