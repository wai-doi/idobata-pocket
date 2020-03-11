module IdobataPocket
  class MessageCreation
    CALL_API_LIMIT = 50
    COUNT = 200

    def self.create_message
      new.create_message
    end

    def initialize
      @items = []
    end

    def create_message
      call_pocket_api
      item = @items.sample
      link_text(text: item.title, url: item.url)
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

    def link_text(text:, url:)
      <<~HTML
      <p>
        ( ¯−¯ )つ
        <a href="#{url}" target="_blank">
          #{text}
        </a>
      </p>
      HTML
    end
  end
end
