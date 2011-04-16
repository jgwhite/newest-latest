# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

require "newest_latest/version"

Gem::Specification.new do |s|
  s.name             = "newest-latest"
  s.version          = NewestLatest::Version::STRING
  s.platform         = Gem::Platform::RUBY
  s.authors          = ["Jamie White"]
  s.email            = ["info@newest-latest.net"]
  s.homepage         = "http://newest-latest.net/"
  s.summary          = "newest-latest-#{NewestLatest::Version::STRING}"
  s.description      = "Monitor feeds for project launch announcements."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "newest-latest"

  s.add_development_dependency("rspec", ["~> 2.5"])
  s.add_development_dependency("rake")

  s.files        = Dir["lib/**/*"] + %w[LICENSE Rakefile README.md]
  s.require_path = "lib"
end
