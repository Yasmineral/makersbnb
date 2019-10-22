# Make sure this spec helper is required in .rspec !

# Require gems
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'bcrypt'

# Specify that this is a Test environment
ENV['ENVIRONMENT'] = 'test'

# Require our Sinatra app file, which turn requires the model files
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Tell Capybara about our app class
Capybara.app = MakersBnB

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end