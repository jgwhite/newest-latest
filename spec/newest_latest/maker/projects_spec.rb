require 'spec_helper'

describe NewestLatest::Maker, "#projects" do

  context "given a project on a maker" do
    let :project do
      NewestLatest::Project.create!
    end

    let :maker do
      NewestLatest::Maker.create! do |maker|
        maker.name = "With Associates"
        maker.projects = [project]
      end
    end

    before do
      project.save!
    end

    it "refernces projects" do
      maker.reload.projects.should == [project]
    end

  end
end
