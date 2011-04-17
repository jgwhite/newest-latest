module NewestLatest # :nodoc:
  # = Project
  #
  # Projects represent sites.
  # Any number of makers can be associated as contributors.
  class Project
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name
    field :url

    # Populates project details by fetching its url
    def profile!
      html = open(self.url)
      homepage = Nokogiri::HTML(html.read)
      homepage.encoding = "utf-8"
      self.name = cleanup_title homepage.css("title").first.content
    end


    private

    def cleanup_title(title) # :nodoc:
      title.match(/^([^:\-|]+)/)[1].strip
    end

  end
end
