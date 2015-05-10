source 'https://rubygems.org'

gem 'rails', '4.1.6'

# Assets gem 
gem 'sass-rails'
gem 'uglifier'
gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'

# Authen and author gem 
gem 'devise', '~> 3.2'
gem 'cancancan'

# Pagination and file upload gem 
gem 'kaminari'
gem 'paperclip'

# Tree data structure
gem 'ancestry'

# API
gem 'grape', '~> 0.9.0'
gem 'grape-rails-cache'

# View engine
gem 'slim-rails'

# Form
gem 'simple_form'

# Fuzzy search and filter gem
gem 'ransack'

# Nice url
gem 'friendly_id'

# Application enviroment variables
gem 'figaro'

# Postgres gem
gem 'pg'

# Web server gem 
gem 'puma'

# Notification system
gem 'mailboxer'

group :development, :test do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'commands'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda'
  gem 'guard-rspec', :require => false
  gem 'guard-cucumber'
  gem 'pry'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :production do
  gem 'capistrano'
  gem 'rvm-capistrano'
end
