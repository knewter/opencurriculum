require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start 'rails'

require "minitest/autorun"
require "minitest/rails"
require 'database_cleaner'
require 'factory_girl'
require 'ruby-debug'
require 'mocha'
require 'ostruct'
require 'minitest/reporters'

ENV["RAILS_ENV"] = "test"
require_relative '../config/environment'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new

require 'capybara/rails'
require 'capybara_minitest_spec'

# If description name ends with 'integration', use this RequestSpec class.
# It has all the integration test goodies.
class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

MiniTest::Spec.register_spec_type /integration$/i, RequestSpec

# Database cleaner.
# Go ahead and clear out the database first
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# Then set up for running the actual tests.
DatabaseCleaner.strategy = :transaction
class MiniTest::Spec
  before do
    DatabaseCleaner.start
  end
  after do
    DatabaseCleaner.clean
  end
end

class MiniTest::Rails::Spec
  # Add methods to be used by all specs here...
end
