$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_store/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_store"
  s.version     = FarmStore::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "eCommerece Plugin"
  s.description = "eCommerce Plugin based on TurboLinks"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"

  # s.add_development_dependency 'rspec-rails'
  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]
end
