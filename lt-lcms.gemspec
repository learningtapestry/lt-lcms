# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lt/lcms/version'

Gem::Specification.new do |spec|
  spec.name          = 'lt-lcms'
  spec.version       = Lt::Lcms::VERSION
  spec.authors       = ['Alexander Kuznetsov']
  spec.email         = ['alexander@learningtapeestry.com']

  spec.homepage    = '' # TODO: Place URL to GitHub page here
  spec.summary     = '' # TODO: Summary of OdellLessonCompiler.
  spec.description = '' # TODO: Description of OdellLessonCompiler.
  spec.license     = 'MIT' # TODO: Update the license.

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_dependency 'google-api-client'
  spec.add_dependency 'httparty'
  spec.add_dependency 'rubyzip', '~> 1.2.1'

  spec.add_development_dependency 'brakeman'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
