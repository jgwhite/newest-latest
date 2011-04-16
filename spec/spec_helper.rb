$:.unshift(File.dirname(__FILE__))
$:.unshift(File.expand_path("../../lib", __FILE__))

require "rspec"
require "newest_latest"

Dir[File.join(__FILE__, "..", "support", "**", "*.rb")].each { |f| require f }

Rspec.configure do |config|
end
