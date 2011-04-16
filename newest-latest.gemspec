$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "newest_latest/version"

Gem::Specification.new do |s|
  s.name             = "newest-latest"
  s.version          = NewestLatest::Version::STRING
  s.platform         = Gem::Platform::RUBY
  s.authors          = ["Jamie White"]
  s.email            = "info@newest-latest.net"
  s.homepage         = "http://newest-latest.net"
  s.summary          = "newest-latest-#{NewestLatest::Version::STRING}"
  s.description      = "Monitor feeds for project launch announcements."

  # s.add_dependency "activemodel", ["~> 3.0"]
  s.add_development_dependency "rspec", ["~> 2.5"]

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = %w[README.md]
  s.rdoc_options     = %w[--charset=UTF-8]
  s.require_path     = "lib"
end
