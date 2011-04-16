require "spec_helper"

describe NewestLatest::Maker, "#discover_projects" do
  use_vcr_cassette

  context "when discovering from Poke's Twitter feed" do
    let :maker do
      NewestLatest::Maker.new :feeds => %w[http://twitter.com/pokelondon]
    end

    subject do
      maker.discover_projects
    end

    it { should have(6).projects }
  end

end
