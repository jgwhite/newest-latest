# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

require "newest_latest/version"

Gem::Specification.new do |s|
  s.name        = "newest-latest"
  s.version     = NewestLatest::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamie White"]
  s.email       = ["info@newest-latest.net"]
  s.homepage    = "http://newest-latest.net/"
  s.summary     = "newest-latest-#{NewestLatest::Version::STRING}"
  s.description = "Monitor feeds for project launch announcements."

  s.add_dependency("bson_ext", ["~> 1.2"])
  s.add_dependency("mongoid" , ["~> 2.0"])
  s.add_dependency("twitter" , ["~> 1.3"])

  s.add_development_dependency("fakeweb", ["~> 1.3"])
  s.add_development_dependency("rspec"  , ["~> 2.5"])
  s.add_development_dependency("rake"   , ["~> 0.8"])
  s.add_development_dependency("vcr"    , ["~> 1.9"])

  s.files = Dir["lib/**/*"] + %w[LICENSE Rakefile README.md]
  s.require_path = "lib"
end