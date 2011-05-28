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

    has_and_belongs_to_many :projects,
                            :class_name => "NewestLatest::Project"

    # Returns projects discovered in feeds
    def discover_projects
      self.feeds.map(&:discover_projects).flatten.uniq.each do |project|
        project.makers << self
      end
    end

    # Returns persisted projects discovered in feeds
    def discover_projects!
      self.discover_projects.each(&:save!)
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
