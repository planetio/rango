$:.push File.expand_path("../lib", __FILE__)
require "rango/version"

Gem::Specification.new do |s|
  s.name        = 'rango'
  s.version     = Rango::VERSION.dup
  s.summary     = "Rango"
  s.description = "A ruby wrapper to the TangoCard Api"
  s.authors     = ["Peter Philips"]
  s.email       = 'peter@planet.io'
  s.files       = ["lib/rango.rb"]
  s.homepage    = 'https://github.com/planetio/rango'
  s.license     = 'MIT'
  s.require_paths = ['lib']
  s.files       = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")  
  s.add_runtime_dependency 'unirest', '1.1.1'
  s.add_runtime_dependency 'activesupport'

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  
end