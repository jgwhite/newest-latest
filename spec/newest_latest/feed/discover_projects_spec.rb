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

    it "returns 7 projects" do
      should have(7).projects
    end

    it "returns objects of type NewestLatest::Project" do
      subject.first.should be_a NewestLatest::Project
    end

    it "returns http://thefeed.orange.co.uk" do
      subject.first.url.should == "http://thefeed.orange.co.uk/"
    end
  end

end
