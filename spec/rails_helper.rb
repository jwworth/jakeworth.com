ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.before(:each) do
    DatabaseCleaner.clean
  end
end
