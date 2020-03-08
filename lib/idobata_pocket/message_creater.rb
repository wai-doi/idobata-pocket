module IdobataPocket
  class MessageCreation
    CALL_API_LIMIT = 100
    COUNT = 100

    def self.create_message
      new.create_message
    end

    def initialize
      @items = []
    end

    def create_message
      call_pocket_api
      item = @items.sample
      "#{item.title}\n#{item.url}"
    end

    private

    def call_pocket_api
      CALL_API_LIMIT.times do |i|
        response = PocketClient.retrieve(count: COUNT, offset: COUNT * i)
        items = ResponseParser.new(response).items
        @items += items

        break if items.size != COUNT
        sleep 0.1
      end
    end
  end
end
