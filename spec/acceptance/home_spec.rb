# -*- encoding: utf-8 -*-
require "acceptance_helper"

describe "The home page" do

  context "given we're following Poke and With Associates" do
    let! :poke do
      NewestLatest::Maker.create!(
        :name  => "Poke London",
        :url   => "http://pokelondon.com/",
        :feeds => "http://twitter.com/pokelondon"
      )
    end

    let! :with_associates do
      NewestLatest::Maker.create(
        :name  => "With Associates",
        :url   => "http://withassociates.com/",
        :feeds => "http://twitter.com/withassociates"
      )
    end

    before do
      visit "/"
    end

    it "has a great title" do
      page.should have_css "title", :text => "The Newest Latest"
    end

    it "has a great heading" do
      page.should have_css "h1", :text => "The Newest Latest"
    end

    it "has a great description" do
      page.should have_css "h2",
        :text => "Feed of brand new work from the web’s favourite makers."
    end
  end

end
