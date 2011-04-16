VCR.config do |config|
  config.cassette_library_dir = File.expand_path('../../fixtures/vcr_cassettes', __FILE__)
  config.stub_with :fakeweb
  config.allow_http_connections_when_no_cassette = true
	config.default_cassette_options = { :record => :new_episodes }
end
