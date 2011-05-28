require "sinatra"
require "erb"

module NewestLatest
  class Server < Sinatra::Application
    get "/" do
      @projects = Project.order_by(:created_at).desc.all
      erb :home, :format => :html
    end
  end
end
