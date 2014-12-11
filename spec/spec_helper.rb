require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.expect_with :rspec

    config.mock_with :rspec

    config.filter_run :focus
    config.run_all_when_everything_filtered = true

    config.order = :random

    Kernel.srand config.seed
  end
end

Spork.each_run do
end
