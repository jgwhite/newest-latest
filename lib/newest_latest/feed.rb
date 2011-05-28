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

    # Returns an array of Projects
    def discover_projects
      case self.url
      when /twitter\.com/
        scan_twitter_timeline
      else
        raise UnsupportedSourceError, "Cannot discover from #{self.url}"
      end
    end


    private

    def scan_twitter_timeline # :nodoc:
      user = self.url.match(/twitter\.com\/(.+)$/)[1]
      discoveries = []

      Twitter.user_timeline(user).each do |tweet|
        url = nil

        if keywords = tweet.text.match(/(launch|live|new|project)/i)
          if !(urls = tweet.text.scan(/http:\/\/[^ ]+/i)).empty?
            url = urls.first
          elsif !(twits = tweet.text.scan(/@[a-z0-9_]+/i)).empty?
            url = Twitter.user(twits.last.delete("@")).url
          end
        end

        if url && discoveries.all? { |d| d.url != url }
          project = NewestLatest::Project.find_or_initialize_by(:url => url)
          project.created_at ||= tweet.created_at
          project.profile! if project.name.nil?
          discoveries << project
        end
      end

      discoveries
    end

  end
end
