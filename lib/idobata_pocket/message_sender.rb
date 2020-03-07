require 'uri'

module IdobataPocket
  class MessageSender
    def send(message)
      params = { source: message }
      http.post(uri.path, URI.encode_www_form(params))
    end

    private

    def uri
      @uri ||= URI.parse(ENV['IDOBATA_ENDPOINT_URL'])
    end

    def http
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http
    end
  end
end
