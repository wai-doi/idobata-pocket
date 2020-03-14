module IdobataPocket
  class MessageCreator
    def initialize(item)
      @item = item
    end

    def link_text
      <<~HTML
      <p>
        ( ¯−¯ )つ
        <a href="#{@item.url}" target="_blank">
          #{@item.title}
        </a>
      </p>
      HTML
    end
  end
end
