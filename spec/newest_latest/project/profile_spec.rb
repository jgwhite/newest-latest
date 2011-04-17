require "spec_helper"

describe NewestLatest::Project, "#profile!" do
  use_vcr_cassette

  subject do
    NewestLatest::Project.new :url => "http://www.cutlasercut.com/"
  end

  before do
    subject.profile!
  end

  its(:name) { should == "Cut laser cut" }
end
