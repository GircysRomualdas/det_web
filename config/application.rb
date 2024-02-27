require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Web
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.available_locales = [:en, :lt]
    config.i18n.default_locale = :en 
    config.i18n.fallbacks = true
  end
end
