source 'https://rubygems.org'

gem 'rails', '4.1.6'

# Assets gem 
gem 'sass-rails'
gem 'uglifier'
gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'

# Authen and author gem 
gem 'devise'
gem 'cancancan'

# CMS
gem 'comfortable_mexican_sofa', '1.12.2'

# Pagination and file upload gem 
gem 'kaminari'
gem 'paperclip'

# Tree data structure
gem 'ancestry'

# API
gem 'grape'

# View engine
gem 'slim-rails'

# Form
gem 'simple_form'

# Fuzzy search and filter gem
gem 'ransack'

# Nice url
gem 'friendly_id'

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'rspec-rails'
  gem 'guard-spring'
  gem 'guard-rspec', :require => false
  gem 'guard-cucumber'
  gem 'pry'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :production do
  gem 'capistrano'

  # Web server gem 
  gem 'thin'
end
