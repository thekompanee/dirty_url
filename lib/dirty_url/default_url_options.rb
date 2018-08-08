# frozen_string_literal: true

require 'yaml'

module DirtyUrl
class  DefaultUrlOptions
  def self.fetch
    return Chamber.env.http.url_components.symbolize_keys if defined?(Chamber)

    settings_file = application.root.join('config', 'dirty_url.yml')
    YAML.safe_load(File.read(settings_file)).symbolize_keys
  end
end
end
