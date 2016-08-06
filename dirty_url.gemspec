# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dirty_url/version'

Gem::Specification.new do |spec|
  spec.name          = 'dirty_url'
  spec.version       = DirtyUrl::VERSION
  spec.authors       = ['jfelchner']
  spec.email         = 'accounts+git@thekompanee.com'
  spec.summary       = %q{Make URLs work properly in Rails mailers and controllers.}
  spec.description   = %q{By 'default', Rails has a difficult time figuring out when it is supposed to show relative URLs in mailers and even when doing comparisons in specs, the URL returned tends to be non-deterministic. Using this gem, Rails will always return the proper URL based on the environment you are executing in.}
  spec.homepage      = 'https://github.com/thekompanee/dirty_url'
  spec.license       = 'MIT'

  spec.cert_chain    = %w{certs/thekompanee.pem}
  spec.signing_key   = File.expand_path('~/.gem/certs/thekompanee-private_key.pem') if $0 =~ /gem\z/

  spec.executables   = %w{}
  spec.files         = Dir['{app,config,db,lib,templates}/**/*'] + %w{Rakefile README.md LICENSE.txt}
  spec.test_files    = Dir['{test,spec,features}/**/*']

  spec.add_dependency             'rails', ["< 6.0", ">= 3.1"]

  spec.add_development_dependency 'rspec', ["~> 3.2"]

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
end
