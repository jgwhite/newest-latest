require 'spec_helper'

describe NewestLatest::Project, "#makers" do
  context "given a project and a maker" do
    let :maker do
      NewestLatest::Maker.create!
    end

    let :project do
      NewestLatest::Project.create! do |project|
        project.makers = [maker]
      end
    end

    it "references makers" do
      project.reload.makers.should == [maker]
    end
  end
end
