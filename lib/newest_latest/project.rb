# -*- encoding: utf-8 -*-
module NewestLatest # :nodoc:
  # = Project
  #
  # Projects represent sites.
  # Any number of makers can be associated as contributors.
  class Project
    include Mongoid::Document
    include Mongoid::Timestamps

    # Minimum length for the project's name
    # used when cleaning up page title
    MIN_NAME_LENGTH = 10

    field :name
    field :url
    field :sources, :type => Array

    has_and_belongs_to_many :makers,
                            :class_name => "NewestLatest::Maker"

    # Populates project details by fetching its url
    def profile!
      html = open(self.url)
      homepage = Nokogiri::HTML(html.read)
      homepage.encoding = "utf-8"
      self.name = cleanup_title homepage.css("title").first.content
    rescue
      self.name = self.url
    end


    private

    def cleanup_title(title, min_length = MIN_NAME_LENGTH) # :nodoc:
      tokens = title.split(/\s*[\-:|—–]+\s*/)
      result = []
      while result.join(" ").length < min_length && tokens.length > 0
        result << tokens.shift
      end
      result.join(" ")
    end

  end
end
