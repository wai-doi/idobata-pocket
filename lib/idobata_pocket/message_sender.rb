require 'uri'

module IdobataPocket
  class MessageSender
    def self.send(message)
      new(message).send
    end

    def initialize(message)
      @message = message
      @uri = URI.parse(ENV['IDOBATA_ENDPOINT_URL'])
    end

    def send
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
