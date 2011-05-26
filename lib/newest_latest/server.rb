require "sinatra"

module NewestLatest
  class Server < Sinatra::Application
    get "/" do
      "Hello!"
    end
  end
end
