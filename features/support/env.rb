require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require 'cucumber/rails'
  require 'rspec/expectations'
  require 'capybara/cucumber'
  require 'capybara/poltergeist'
  require 'factory_girl'
  require "#{Rails.root}/spec/support/deferred_garbage_collection.rb"

  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    options = {
      :js_errors => true,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end

  ActionController::Base.allow_rescue = false
  Cucumber::Rails::World.use_transactional_fixtures = false
  
  begin
    require 'database_cleaner'
    require 'database_cleaner/cucumber'
    DatabaseCleaner.strategy = :truncation
    #DatabaseCleaner.clean_with(:truncation)
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Before do
    DeferredGarbageCollection.start
    DatabaseCleaner.start
  end

  After do
    DeferredGarbageCollection.reconsider
    FactoryGirl.factories.clear
    FactoryGirl.sequences.clear
    FactoryGirl.traits.clear
    FactoryGirl.find_definitions
    DatabaseCleaner.clean
  end

  Around do |scenario, block|
    DatabaseCleaner.cleaning(&block)
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
