source 'https://rubygems.org'

# Declare your gem's dependencies in farm_store.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'farm_slugs', :git => 'https://github.com/jessethebuilder/farm_slugs'

group :test, :development do
  gem 'faker'
  gem 'rspec-rails'
  gem 'database_cleaner'
  # gem 'database_cleaner', '~> 1.0.0rc'
  gem 'timecop'
  gem 'byebug'
end

group :test do
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'selenium-webdriver'
  gem 'shoulda'
  # gem 'launchy', '~> 2.4.0'
  gem 'launchy'
  gem 'poltergeist'
  #gem 'webrat'
end

group :development do
  gem 'web-console', '~> 2.0'
end

ruby '2.3.1'
