require 'uri'
require 'net/http'

class PocketClient
  POCKET_API_URL = "https://getpocket.com/v3/get"

  def initialize(count:, offset:)
    @count = count
    @offset = offset
  end

  def post
    http.post(uri.path, params.to_json, headers)
  end

  private

  def http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

  def uri
    @uri ||= URI.parse(POCKET_API_URL)
  end

  def headers
    { "Content-Type" => "application/json" }
  end

  def params
    {
      consumer_key: ENV['POCKET_CONSUMER_KEY'],
      access_token: ENV['POCKET_ACCESS_TOKEN'],
      count: @count,
      offset: @offset
    }
  end
end
