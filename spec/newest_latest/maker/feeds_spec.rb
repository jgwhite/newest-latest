require "spec_helper"


describe NewestLatest::Maker, "#feeds=" do

  let(:twit_url) { "http://twitter.com/pokelondon" }
  let(:blog_url) { "http://www.pokelondon.com/blog/latest.rss" }
  let(:strings)  { [twit_url, blog_url] }
  let(:feeds)    { [ NewestLatest::Feed.new(:url => twit_url),
                     NewestLatest::Feed.new(:url => blog_url) ] }

  shared_examples_for "an object that can remember feeds" do
    it "adds feeds to the Maker" do
      subject.feeds[0].should be_a NewestLatest::Feed
      subject.feeds[0].url.should == twit_url
      subject.feeds[1].should be_a NewestLatest::Feed
      subject.feeds[1].url.should == blog_url
    end
  end

  context "when sending NewestLatest::Feeds to the direct writer" do
    subject { NewestLatest::Maker.new { |m| m.feeds = feeds } }
    it_behaves_like "an object that can remember feeds"
  end

  context "when sending strings to the direct writer" do
    subject { NewestLatest::Maker.new { |m| m.feeds = strings } }
    it_behaves_like "an object that can remember feeds"
  end

  context "when sending NewestLatest::Feeds to the attributes writer" do
    subject { NewestLatest::Maker.new(:feeds => feeds) }
    it_behaves_like "an object that can remember feeds"
  end

  context "when sending strings to the attributes writer" do
    subject { NewestLatest::Maker.new(:feeds => strings) }
    it_behaves_like "an object that can remember feeds"
  end

end
