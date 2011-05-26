require "bundler"
Bundler.setup

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "rspec"
require "sinatra"
require "rack/test"
require "vcr"

$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "newest_latest"
require "newest_latest/server"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.include Rack::Test::Methods
  config.include NewestLatest::ServerMethods
end
