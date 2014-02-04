ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'capybara-screenshot/minitest'
require 'database_cleaner'
require 'mocha/mini_test'

Capybara.default_driver = :poltergeist
DatabaseCleaner.strategy = :truncation
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  self.use_transactional_fixtures = false

  def setup
    DatabaseCleaner.clean
    ActionMailer::Base.deliveries = []
  end

  def sign_up_user
    visit new_user_session_path
    click_on 'Sign up'
    fill_in 'Email address', with: 'mattlins@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    ActionMailer::Base.deliveries.last.encoded =~ /confirmation_token=(.+)"/

    visit user_confirmation_path(confirmation_token: $1)
  end

  def sign_in_user
    visit new_user_session_path
    fill_in 'Email address', with: 'mattlins@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
  end
end
