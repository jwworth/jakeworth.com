# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.4'

gem 'rails', '5.0.7'

gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
gem 'authem'
gem 'draper', git: 'https://github.com/audionerd/draper', branch: 'rails5'
gem 'figaro'
gem 'haml-rails'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'kaminari'
gem 'pg'
gem 'puma'
gem 'redcarpet'
gem 'rouge'
gem 'sass-rails', '~> 5.0'
gem 'twitter'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'rubocop'
end

group :development, :test do
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
end

group :production do
  gem 'airbrake'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara-webmock'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'flatware-cucumber', require: false
  gem 'flatware-rspec', require: false
  gem 'launchy'
  gem 'selenium-webdriver'
end
