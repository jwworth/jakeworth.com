require 'simplecov'
require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :capybara_webmock
Capybara::Webmock.start

at_exit do
  Capybara::Webmock.stop
end
