require 'bundler/setup'
Bundler.require
require_relative 'lib/idobata_pocket'

include IdobataPocket

desc 'idobataにpocketのリストからランダムで記事を投稿する'
task :send_random_item do
  pocket_items = PocketRetrievingClient.call
  message = MessageCreator.new(pocket_items.sample).link_text
  MessageSender.call(message)
end
