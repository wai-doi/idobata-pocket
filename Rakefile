require 'bundler/setup'
Bundler.require
require_relative 'lib/idobata_pocket'

ENV['TZ'] = 'Asia/Tokyo'

include IdobataPocket

desc 'idobataにpocketのリストからランダムで記事を投稿する'
task :send_random_item do
  exit if HolidayJp.holiday?(Date.today)

  pocket_items = PocketRetrievingClient.call
  message = MessageCreator.new(pocket_items.sample).link_text
  MessageSender.call(message)
end
