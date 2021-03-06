require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Speedmsg
  class Application < Rails::Application

    config.load_defaults 5.1

    config.time_zone = 'America/Fortaleza'

    config.i18n.default_locale = "pt-BR"

    Date::DATE_FORMATS[:default] = "%d/%m/%Y"

    config.generators.system_tests = nil
  end
end
