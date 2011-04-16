require "spec_helper"

describe NewestLatest::Feed, "#discover_projects" do
  use_vcr_cassette

  context "when pointed at Poke's Twitter feed" do
    let :feed do
      NewestLatest::Feed.new :url => "http://twitter.com/pokelondon"
    end

    subject do
      feed.discover_projects
    end

    it { should have(6).projects }
    its("first") { should be_a NewestLatest::Project }
    its("first.url") { should == "http://thefeed.orange.co.uk/" }
  end

end
