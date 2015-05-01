require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module WorthChicagoCo
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.raise_in_transactional_callbacks = true
  end
end
