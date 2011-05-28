# -*- encoding: utf-8 -*-
require "acceptance_helper"

describe "The home page" do

  context "given we're following Poke and With Associates" do
    use_vcr_cassette

    let! :poke do
      NewestLatest::Maker.create!(
        :name  => "Poke",
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
      poke.discover_projects.each(&:save!)
      with_associates.discover_projects.each(&:save!)
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
        :text => "A feed of brand new work from the web’s favourite makers."
    end

    context "item for The Book of CSS3" do
      subject do
        page.find "#the-book-of-css3"
      end

      it "exists" do
        should be
      end

      it "has a link to project" do
        should have_css "a", :text => "The Book of CSS3"
      end

      it "has a link to the maker" do
        should have_css "a", :text => "Poke"
      end
    end

    context "item for Pin Me If You Can" do
      subject do
        page.find "#pin-me-if-you-can"
      end

      it "exists" do
        should be
      end

      it "has a link to project" do
        should have_css "a", :text => "Pin Me If You Can"
      end

      it "has a link to the maker" do
        should have_css "a", :text => "Poke"
      end
    end

    context "item for Webbys Netted" do
      subject do
        page.find "#webbys-netted"
      end

      it "exists" do
        should be
      end

      it "has a link to project" do
        should have_css "a", :text => "Webbys Netted"
      end

      it "has a link to the maker" do
        should have_css "a", :text => "Poke"
      end
    end

    context "item for Bryan Blake, Web Designer" do
      subject do
        page.find "#bryan-blake-web-designer"
      end

      it "exists" do
        should be
      end

      it "has a link to project" do
        should have_css "a", :text => "Bryan Blake, Web Designer"
      end

      it "has a link to the maker" do
        should have_css "a", :text => "With Associates"
      end
    end

    context "item for With Associates" do
      subject do
        page.find "#with-associates"
      end

      it "exists" do
        should be
      end

      it "has a link to project" do
        should have_css "a", :text => "With Associates"
      end

      it "has a link to the maker" do
        should have_css "a", :text => "With Associates"
      end
    end
  end

end
