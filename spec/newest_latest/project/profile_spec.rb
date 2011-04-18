require "spec_helper"

describe NewestLatest::Project, "#profile!" do
  use_vcr_cassette

  before do
    subject.profile!
  end

  context "with http://www.cutlasercut.com/" do
    subject do
      NewestLatest::Project.new :url => "http://www.cutlasercut.com/"
    end

    its(:name) { should == "Cut laser cut" }
  end

  context "with http://bbc.in/eak1TI" do
    subject do
      NewestLatest::Project.new :url => "http://bbc.in/eak1TI"
    end

    its(:name) { should == "BBC Music Introducing" }
  end
end
