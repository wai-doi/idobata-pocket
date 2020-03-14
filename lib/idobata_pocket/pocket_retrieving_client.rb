require 'uri'
require 'net/http'

module IdobataPocket
  class PocketRetrievingClient
    POCKET_API_URL = "https://getpocket.com/v3/get"
    HEADERS = { "Content-Type" => "application/json" }
    REQUIRED_OPTIONS = {
      consumer_key: ENV['POCKET_CONSUMER_KEY'],
      access_token: ENV['POCKET_ACCESS_TOKEN']
    }
    CALL_API_LIMIT = 50
    COUNT = 200

    def self.call
      new.call
    end

    def initialize
      @uri = URI.parse(POCKET_API_URL)
      @items = []
    end

    def call
      call_pocket_api
      @items
    end

    private

    def call_pocket_api
      CALL_API_LIMIT.times do |i|
        response = send_api_request(count: COUNT, offset: COUNT * i)
        items = ResponseParser.new(response).items
        @items += items

        break if items.size != COUNT
        sleep 0.1
      end
    end

    def send_api_request(options)
      params = options.merge(REQUIRED_OPTIONS)
      http.post(@uri.path, params.to_json, HEADERS)
    end

    def http
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http
    end
  end
end
