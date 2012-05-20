source 'http://rubygems.org'

gem 'rails', '3.1.1'

#gem 'pg'

#gem 'sqlite3'

gem 'heroku'

gem 'thin'

gem 'therubyracer', :platforms => :ruby

gem 'jquery-rails'

gem 'bcrypt-ruby', :require => 'bcrypt'

gem 'will_paginate'


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end