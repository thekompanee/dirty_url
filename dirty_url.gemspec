# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dirty_url/version'

Gem::Specification.new do |gem|
  gem.rubygems_version  = '1.3.5'

  gem.name              = 'dirty_url'
  gem.rubyforge_project = 'dirty_url'

  gem.version           = DirtyUrl::VERSION
  gem.platform          = Gem::Platform::RUBY

  gem.authors           = %w{jfelchner}
  gem.email             = 'accounts+git@thekompanee.com'
  gem.date              = Time.now
  gem.homepage          = 'https://github.com/thekompanee/dirty_url'

  gem.summary           = %q{Make URLs work properly in Rails mailers and controllers.}
  gem.description       = <<-THEDOCTOR
By 'default', Rails has a difficult time figuring out when it is supposed to
show relative URLs in mailers and even when doing comparisons in specs, the URL
returned tends to be non-deterministic. Using this gem, Rails will always return
the proper URL based on the environment you are executing in.
THEDOCTOR

  gem.rdoc_options      = ['--charset = UTF-8']
  gem.extra_rdoc_files  = %w{README.md}

  gem.executables       = Dir['{bin}/**/*'].map {|dir| dir.gsub!(/\Abin\//, '')}
  gem.files             = Dir['{app,config,db,lib}/**/*'] + %w{Rakefile README.md}
  gem.test_files        = Dir['{test,spec,features}/**/*']
  gem.require_paths     = ['lib']

  gem.add_dependency              'rails',          ['>= 3.1', '< 5.0']
end
