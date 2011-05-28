# -*- encoding: utf-8 -*-
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

    let :description do
      "A feed of brand new work from the web’s favourite makers."
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

    context "the response body" do
      subject do
        last_response.body
      end

      it "has a title tag" do
        should include "<title>The Newest Latest</title>"
      end

      it "has a meta description" do
        should include %{<meta name="description" value="#{description}" />}
      end

      it "has a heading" do
        should include "<h1>The Newest Latest</h1>"
      end

      it "has a sub-heading" do
        should include "<h2>#{description}</h2>"
      end
    end
  end

end
