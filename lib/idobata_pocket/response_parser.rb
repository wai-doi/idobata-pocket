require 'json'

module IdobataPocket
  class ResponseParser
    def initialize(response)
      @response = response
    end

    def items
      json['list'].values.map { |item| PocketItem.new(item) }
    end

    private

    def json
      JSON.parse(@response.body)
    end
  end
end
