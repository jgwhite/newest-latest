# -*- encoding: utf-8 -*-
require "spec_helper"

describe NewestLatest::Maker, "#discover_projects" do
  use_vcr_cassette

  context "when discovering from Poke's Twitter feed" do
    let :maker do
      NewestLatest::Maker.new :feeds => %w[http://twitter.com/pokelondon]
    end
    let :discoveries do
      maker.discover_projects
    end
    it "should have discovered The Feed" do
      discoveries[0].name.should == "The Feed"
    end
    it "should have discovered I’m looking for the new me. Is it you?" do
      discoveries[1].name.should == "I’m looking for the new me. Is it you?"
    end
    it "should have discovered POKE" do
      discoveries[2].name.should == "POKE"
    end
    it "should have discovered The Feed (again)" do
      discoveries[3].name.should == "The Feed"
    end
    it "should have discovered Instaprint" do
      discoveries[4].name.should == "Instaprint"
    end
    it "should have discovered Lovie Awards" do
      discoveries[5].name.should == "Lovie Awards"
    end
  end

end
