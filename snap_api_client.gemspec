# frozen_string_literal: true

require_relative 'lib/snap_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'snap_api_client'
  spec.version       = SnapAPIClient::VERSION
  spec.authors       = ['Lawrance Shepstone']
  spec.email         = ['lawrance@collabcollective.com']

  spec.summary       = 'Snap API Client'
  spec.description   = 'API client library for consuming Snap API resources'
  spec.homepage      = 'https://github.com/collcoll/snap-api-client'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http', '~> 4.4'
  spec.add_dependency 'thor', '~> 1.1'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
