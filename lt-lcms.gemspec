# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lt/lcms/version'

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = 'lt-lcms'
  spec.version       = Lt::Lcms::VERSION
  spec.authors       = ['Alexander Kuznetsov']
  spec.email         = %w(alexander@learningtapeestry.com paranoic.san@gmail.com)

  spec.homepage    = 'https://github.com/learningtapestry/lt-lcms'
  spec.summary     = 'Contains set of classes to work with Google Docs based lesson objects'
  spec.description = ''
  spec.license     = 'Apache-2.0'

  spec.required_ruby_version = '>= 3.2'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    spec.metadata['rubygems_mfa_required'] = 'true'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'google-api-client', '~> 0.38'
  spec.add_dependency 'httparty', '~> 0.18'
  spec.add_dependency 'lt-google-api', '~> 0.2', '>= 0.2.4'
  spec.add_dependency 'nokogiri', '~> 1.10', '>= 1.10.8'
  spec.add_dependency 'rubyzip', '~> 2'

  spec.add_development_dependency 'bundler', '~> 2.4'
  spec.add_development_dependency 'overcommit', '~> 0.60'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.54'
  spec.add_development_dependency 'steep', '~> 1.5.3'
end
