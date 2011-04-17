module NewestLatest # :nodoc:
  # = Maker
  #
  # Makers represent developers, designers, companies, anyone creating
  # project on the web.
  class Maker
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name
    field :url

    embeds_many :feeds,
                :class_name => "NewestLatest::Feed",
                :inverse_of => :maker

    # Returns projects discovered in feeds
    def discover_projects
      self.feeds.map(&:discover_projects).flatten.uniq
    end

    # Interpolates argument from strings to NewestLatest::Feeds
    # on the way through if necessary
    def feeds=(*new_feeds)
      write_attribute :feeds, interpolate_feeds(new_feeds)
    end


    private

    def interpolate_feeds(*new_feeds) # :nodoc:
      [new_feeds].flatten.map { |new_feed|
        case new_feed
        when NewestLatest::Feed then new_feed
        when String then NewestLatest::Feed.new(:url => new_feed)
        end
      }.compact
    end

  end
end
