# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WorthChicagoCo
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.schema_format = :sql
  end
end
