module IdobataPocket
  class MessageCreater
    CALL_API_LIMIT = 100
    COUNT = 100

    def initialize
      @items = []
    end

    def message
      call_pocket_api
      item = @items.sample
      "#{item.title}\n#{item.url}"
    end

    private

    def call_pocket_api
      CALL_API_LIMIT.times do |i|
        client = PocketClient.new(count: COUNT, offset: COUNT * i)
        response = client.post
        items = ResponseParser.new(response).items
        @items += items

        break if items.size != COUNT
        sleep 0.1
      end
    end
  end
end
