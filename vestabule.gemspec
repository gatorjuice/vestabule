# frozen_string_literal: true

require_relative 'lib/vestabule/version'

Gem::Specification.new do |spec|
  spec.name = 'vestabule'
  spec.version = Vestabule::VERSION
  spec.authors = ['James Gates']
  spec.email = ['gatorjuice@gmail.com']

  spec.summary = 'Vestaboard API Client'
  spec.description = 'Vestaboard API Client'
  spec.homepage = 'https://github.com/gatorjuice/vestabule'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/gatorjuice/vestabule'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
