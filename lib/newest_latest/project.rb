module NewestLatest # :nodoc:
  # = Project
  #
  # Projects represent sites.
  # Any number of makers can be associated as contributors.
  class Project
    include Mongoid::Document
    field :url
  end
end