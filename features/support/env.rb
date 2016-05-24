require 'simplecov'
require 'cucumber/rails'

ActionController::Base.allow_rescue = false

Capybara.configure do |config|
  config.javascript_driver = :webkit
end

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation
