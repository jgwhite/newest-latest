require "bundler"
Bundler.setup

require "rspec"
require "vcr"

$:.unshift File.expand_path("../../../lib", __FILE__)

require "newest_latest"
