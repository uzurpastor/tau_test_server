require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 7.0

    config.api_only = true
    config.force_ssl = true
    # config.ssl_options =  { hsts: { preload: true, expires: 1.year, subdomains: true }, 
    #                         redirect: { status: 307, port: 81 } }
  end
end