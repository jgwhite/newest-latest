module NewestLatest # :nodoc:
  # = Feed
  #
  # Feeds represent announcement sources for Makers
  class Feed
    include Mongoid::Document

    field :url

    embedded_in :maker,
                :class_name => "NewestLatest::Maker",
                :inverse_of => :feeds

    class UnsupportedSourceError < StandardError; end

    # Returns an array of likely project urls
    #
    # Raises UnsupportedSourceError if there's no handler for given feed
    def discover_project_urls
      case self.url
      when /twitter\.com/
        scan_twitter_timeline
      else
        raise UnsupportedSourceError, "Cannot discover from #{self.url}"
      end
    end

    # Returns an array of Projects
    def discover_projects
      discover_project_urls.map do |url|
        NewestLatest::Project.new(:url => url).tap do |project|
          project.profile!
        end
      end
    end


    private

    def scan_twitter_timeline # :nodoc:
      user = self.url.match(/twitter\.com\/(.+)$/)[1]
      Twitter.user_timeline(user).inject([]) { |result, tweet|
        if keywords = tweet.text.match(/(launch|live|new|project)/i)
          if url = tweet.text.match(/(http:\/\/[^ ]+)/i)
            result << $1
          elsif url = tweet.text.match(/(@[a-z0-9_]+)/i)
            if url = Twitter.user(url[1].delete("@")).url
              result << url
            end
          end
        end
        result
      }.uniq
    end

  end
end
