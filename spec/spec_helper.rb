ENV["RACK_ENV"] ||= "test"
require "rspec"
require "capybara/rspec"
require "csv"

require_relative "../server"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('votes.csv', 'w') { |file| file.puts(["pokemon"]) }
  end

  config.after(:each) do
    CSV.open('votes.csv', 'w') { |file| file.puts(["pokemon"]) }
  end
end
