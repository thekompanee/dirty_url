# frozen_string_literal: true

require 'dirty_url/default_url_options'

module DirtyUrl
  class Railtie < Rails::Railtie
    initializer 'dirty_url.load', after: :load_environment_config do |application|
      default_url_options ||= ::DirtyUrl::DefaultUrlOptions.fetch

      application.config.action_controller.default_url_options = default_url_options
      application.config.action_dispatch.default_url_options   = default_url_options
      application.config.action_mailer.default_url_options     = default_url_options
      application.routes.default_url_options                   = default_url_options

      if ActionMailer::Base.respond_to?(:'default_url_options=')
        ActionMailer::Base.default_url_options = default_url_options
      end
    end
  end
end
