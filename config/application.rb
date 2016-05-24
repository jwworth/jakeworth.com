require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module WorthChicagoCo
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
  end
end
