require "bundler"
Bundler.setup

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "vcr"
require "rspec"
require "rack/test"
require "capybara/rspec"
require "database_cleaner"

$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "newest_latest"
require "newest_latest/server"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.include Rack::Test::Methods
  config.include NewestLatest::Spec::Helpers
  config.before do
    DatabaseCleaner.orm = "mongoid"
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
