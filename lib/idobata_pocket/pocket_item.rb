module IdobataPocket
  class PocketItem
    attr_reader :title, :url

    def initialize(args)
      @title = args['given_title']
      @url = args['given_url']
    end
  end
end
