require "bundler"
require "bundler/setup"
Bundler::GemHelper.install_tasks

require "rake"
require "rspec"
require "rspec/core/rake_task"

$:.unshift File.expand_path("../lib", __FILE__)
require "newest_latest/version"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :fetch_examples do
  require "open-uri"
  require "json"
  api_root = "http://api.twitter.com/1/statuses/user_timeline"
  %w[pokelondon withassociates].each do |user|
    stamp = Time.now.strftime("%Y-%m-%d")
    out = File.expand_path "../examples/twitter/#{user}-#{stamp}.json", __FILE__
    next if File.exists?(out)
    open("#{api_root}/#{user}.json?trim_user=1") do |response|
      data = JSON.parse response.read
      File.open(out, "w") do |f|
        f.puts "// I've gone through and marked tweets we should be picking up"
        f.puts "// with DISCOVER! and the keyword reasoning"
        f << JSON.pretty_generate(data)
      end
    end
  end
end

task :default => :spec
