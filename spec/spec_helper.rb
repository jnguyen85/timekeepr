ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

# Code below found on internet
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  # config.include Devise::TestHelpers, type: :controller #Will comment out until we start using devise
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    # DatabaseCleaner.start
  end
end