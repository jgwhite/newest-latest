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

    it "discovers 6 projects" do
      discoveries.should have(7).projects
    end

    it "discovers The Feed Orange" do
      discoveries[0].name.should == "The Feed Orange"
    end

    it "discovers I’m looking for the new me. Is it you?" do
      discoveries[1].name.should == "I’m looking for the new me. Is it you?"
    end

    it "discovers POKE" do
      discoveries[2].name.should == "POKE"
    end

    it "discovers POKE (again)" do
      discoveries[3].name.should == "POKE"
    end

    it "discovers The Feed Orange (again)" do
      discoveries[4].name.should == "The Feed Orange"
    end

    it "discovers Instaprint" do
      discoveries[5].name.should == "Instaprint"
    end

    it "discovers Lovie Awards" do
      discoveries[6].name.should == "Lovie Awards"
    end

    it "adds the maker to the projects" do
      discoveries.each do |project|
        project.makers.should == [maker]
      end
    end

    it "adds the project to the maker's projects" do
      maker.projects.should == discoveries
    end

    context "with a bang!" do
      before do
        maker.save!
      end

      let :discoveries do
        maker.discover_projects!
      end

      it "persists the projects" do
        discoveries.each do |project|
          project.persisted?.should be_true
        end
      end
    end
  end

end
