require "sinatra"
require "erb"

module NewestLatest
  class Server < Sinatra::Application
    get "/" do
      @projects = Project.all.desc(:created_at)
      erb :home, :format => :html
    end
  end
end
