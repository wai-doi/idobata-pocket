require 'uri'

module IdobataPocket
  class MessageSender
    def self.call(message)
      new(message).call
    end

    def initialize(message)
      @message = message
      @uri = URI.parse(ENV['IDOBATA_ENDPOINT_URL'])
    end

    def call
      params = { source: @message, format: 'html' }
      http.post(@uri.path, URI.encode_www_form(params))
    end

    private

    def http
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http
    end
  end
end
