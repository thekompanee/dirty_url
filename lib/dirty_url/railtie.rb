# frozen_string_literal: true
require 'yaml'

module DirtyUrl
  class Railtie < Rails::Railtie
    initializer 'dirty_url.load', after: :load_environment_config do |application|
      url_components = if defined?(Chamber)
                         Chamber.env.http.url_components.symbolize_keys
                       else
                         settings_file = application.root.join('config', 'dirty_url.yml')
                         YAML.load(File.read(settings_file)).symbolize_keys
                       end

      application.config.action_controller.default_url_options = url_components
      application.config.action_dispatch.default_url_options   = url_components
      application.config.action_mailer.default_url_options     = url_components
      application.routes.default_url_options                   = url_components

      if ActionMailer::Base.respond_to?(:'default_url_options=')
        ActionMailer::Base.default_url_options = url_components
      end
    end
  end
end
