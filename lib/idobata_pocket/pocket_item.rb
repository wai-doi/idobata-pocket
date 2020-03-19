module IdobataPocket
  class PocketItem
    attr_reader :title, :url, :original

    def initialize(args)
      @title = args['resolved_title'].empty? ? args['given_title'] : args['resolved_title']
      @url = args['resolved_url']
      @original = args
    end
  end
end
