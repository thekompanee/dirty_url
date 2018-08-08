# https://github.com/rspec/rspec-rails/issues/1275

# frozen_string_literal: true

require 'dirty_url/default_url_options'

module RSpec
module Rails
module FeatureExampleGroup
  def default_url_options
    @default_url_options ||= ::DirtyUrl::DefaultUrlOptions.fetch
  end
end
end
end
