require "spec_helper"

describe NewestLatest::Feed, "#discover_project_urls" do
  use_vcr_cassette

  context "when pointed at Poke's Twitter timeline" do
    let :feed do
      NewestLatest::Feed.new :url => "http://twitter.com/pokelondon"
    end

    subject do
      feed.discover_project_urls
    end

    it { should have(7).urls }
    it { should include "http://thefeed.orange.co.uk/" }
    it { should include "http://bit.ly/gYYoWH" }
    it { should include "http://www.pokelondon.com/" }
    it { should include "http://bit.ly/ha7w8c" }
    it { should include "http://instaprint.me/" }
    it { should include "http://www.lovieawards.eu/" }
  end

  context "when pointed at With Associates' Twitter timeline" do
    let :feed do
      NewestLatest::Feed.new :url => "http://twitter.com/withassociates"
    end

    subject do
      feed.discover_project_urls
    end

    it { should have(2).urls }
    it { should include "http://bbc.in/eak1TI" }
    it { should include "http://www.withassociates.com/" }
  end

  context "when pointed at an unsupported url" do
    let :feed do
      NewestLatest::Feed.new :url => "rtmp://bad-feed.net/latest"
    end

    it "raises UnsupportedSourceError" do
      expect { feed.discover_project_urls }.
        to raise_error NewestLatest::Feed::UnsupportedSourceError
    end
  end

end
