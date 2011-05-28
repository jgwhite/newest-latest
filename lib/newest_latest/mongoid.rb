Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("newest_latest_development")
end
