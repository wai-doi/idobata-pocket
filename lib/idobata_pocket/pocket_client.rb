require 'uri'
require 'net/http'

class PocketClient
  POCKET_API_URL = "https://getpocket.com/v3/get"
  HEADERS = { "Content-Type" => "application/json" }
  REQUIRED_OPTIONS = {
    consumer_key: ENV['POCKET_CONSUMER_KEY'],
    access_token: ENV['POCKET_ACCESS_TOKEN']
  }

  def self.retrieve(**options)
    new(options).retrieve
  end

  def initialize(**options)
    @uri = URI.parse(POCKET_API_URL)
    @options = options
  end

  def retrieve
    params = @options.merge(REQUIRED_OPTIONS)
    http.post(@uri.path, params.to_json, HEADERS)
  end

  private

  def http
    http = Net::HTTP.new(@uri.host, @uri.port)
    http.use_ssl = true
    http
  end
end
