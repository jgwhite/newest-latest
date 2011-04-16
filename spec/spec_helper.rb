$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "newest_latest"
require "rspec"
require "vcr"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

Rspec.configure do |config|
  config.extend VCR::RSpec::Macros
end
