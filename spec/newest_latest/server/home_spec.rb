require "spec_helper"

describe NewestLatest::Server, "get /" do

  context "given Poke and With Associates are in the system" do
    let! :poke do
      NewestLatest::Maker.create!(
        :name  => "Poke",
        :url   => "http://www.pokelondon.com/",
        :feeds => %w[http://twitter.com/pokelondon"]
      )
    end

    let! :with_associates do
      NewestLatest::Maker.create!(
        :name  => "With Associates",
        :url   => "http://withassociates.com",
        :feeds => %w[http://twitter.com/withassociates]
      )
    end

    before :each do
      get "/"
    end

    subject do
      last_response
    end

    it "responds ok" do
      should be_ok
    end
  end

end
