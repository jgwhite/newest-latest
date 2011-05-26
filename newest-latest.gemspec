# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "newest_latest/version"

Gem::Specification.new do |s|
  s.name        = "newest-latest"
  s.version     = NewestLatest::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamie White"]
  s.email       = ["info@newest-latest.net"]
  s.homepage    = "http://newest-latest.net/"
  s.summary     = "newest-latest-#{NewestLatest::VERSION}"
  s.description = "Discover project launches automagically."

  s.rubyforge_project = "newest-latest"

  s.add_dependency "bson_ext", "~> 1.3"
  s.add_dependency "mongoid" , "~> 2.0"
  s.add_dependency "nokogiri", "~> 1.4"
  s.add_dependency "sinatra" , "~> 1.2"
  s.add_dependency "twitter" , "~> 1.4"

  s.add_development_dependency "simplecov", "~> 0.4"
  s.add_development_dependency "rack-test", "~> 0.6"
  s.add_development_dependency "capybara" , "~> 0.4"
  s.add_development_dependency "fakeweb"  , "~> 1.3"
  s.add_development_dependency "shotgun"  , "~> 0.9"
  s.add_development_dependency "rspec"    , "~> 2.6"
  s.add_development_dependency "rake"     , "~> 0.9"
  s.add_development_dependency "vcr"      , "~> 1.9"

  s.add_development_dependency "ruby-debug19", "~> 0.11"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
