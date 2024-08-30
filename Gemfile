source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your Ruby version
ruby "3.2.1"

# Sinatra and related gems
gem "sinatra"
gem "sinatra-contrib"

# Use Puma as the app server
gem "puma", "~> 5.0"

# Sinatra ActiveRecord for database interactions
gem "sinatra-activerecord"

# SQLite3 database gem
gem "sqlite3", "~> 1.4"

# HTTP requests libraries
gem "unirest"
gem "http", "~> 5.0"

# Static site generator
gem 'middleman'

group :development do
  # Enhanced error pages and debugging
  gem "better_errors"
  gem "binding_of_caller"

  # Pretty printing of table-like data structures
  gem "table_print"

  # Support for AppDev course projects
  gem "appdev_support"
end

group :development, :test do
  # Tool to run code during development and testing
  gem "grade_runner"

  # REPL for Ruby debugging
  gem "pry"
end

group :test do
  # Capybara for feature testing
  gem "capybara"

  # Matchers for AppDev course projects
  gem "draft_matchers"

  # RSpec testing framework
  gem "rspec"

  # Matchers for testing HTML content
  gem "rspec-html-matchers"

  # Stubbing HTTP requests
  gem "webmock"

  # WebDriver utilities for Capybara
  gem "webdrivers"

  # Internationalization support
  gem "i18n"
end
