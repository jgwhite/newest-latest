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
        find_project_urls_in_twitter_timeline
      else
        raise UnsupportedSourceError, "Cannot discover from #{self.url}"
      end
    end

    # Returns an array of Projects
    def discover_projects
      discover_project_urls.map do |url|
        NewestLatest::Project.new(:url => url)
      end
    end


    private


    def find_project_urls_in_twitter_timeline # :nodoc:
      user = self.url.match(/twitter\.com\/(.+)$/)[1]
      Twitter.user_timeline(user).inject([]) { |result, tweet|
        if tweet.text =~ /(launch|live|new|project)/i &&
           tweet.text =~ /(http:\/\/[^ ]+)/i
          result << $1
        end
        result
      }.uniq
    end

  end
end
