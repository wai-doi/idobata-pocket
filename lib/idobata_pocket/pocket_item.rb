module IdobataPocket
  class PocketItem
    attr_reader :original

    def initialize(args)
      @original = args
    end

    def title
      original['resolved_title'].empty? ? original['given_title'] : original['resolved_title']
    end

    def url
      original['resolved_url'].empty? ? original['given_url'] : original['resolved_url']
    end
  end
end
