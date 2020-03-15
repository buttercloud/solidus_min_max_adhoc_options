# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_min_max_adhoc_options/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_min_max_adhoc_options'
  s.version     = SolidusMinMaxAdhocOptions::VERSION
  s.summary     = 'Configure min and max options per ad-hoc option type.'
  s.description = 'Configure min and max options per ad-hoc option type.'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Islam Odeh'.freeze
  s.email     = 'islamodeh@hotmail.com'.freeze
  s.homepage  = 'https://github.com/islamodeh'.freeze

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'solidus_core' # Set Solidus version
  s.add_dependency 'solidus_backend'
  # s.add_dependency 'solidus_flexi_variants'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'gem-release'
  s.add_development_dependency 'deface'
end
