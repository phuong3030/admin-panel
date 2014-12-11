require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'rspec/expectations'
  require 'capybara/cucumber'
  require 'capybara/poltergeist'

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
  Cucumber::Rails::World.use_transactional_fixtures = true
  
  begin
    require 'database_cleaner'
    require 'database_cleaner/cucumber'
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Before do
    DatabaseCleaner.start
  end

  After do |scenario|
    DatabaseCleaner.clean
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
