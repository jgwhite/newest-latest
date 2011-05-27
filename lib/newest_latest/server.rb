require "sinatra"
require "erb"

module NewestLatest
  class Server < Sinatra::Application
    get "/" do
      erb :home, :format => :html
    end
  end
end
