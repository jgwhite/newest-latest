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

    it "sets created_at to match the tweet" do
      subject.first.created_at.
        should == Time.parse("Thu Apr 14 14:03:32 +0000 2011")
    end

    it "set source to the tweet url" do
      subject.first.sources.
        should include "http://twitter.com/pokelondon/status/58530831295201280"
    end
  end

end
