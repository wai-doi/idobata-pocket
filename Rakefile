require 'dotenv/load'
require 'pry'
require_relative 'lib/idobata_pocket'

desc 'idobataにpocketのリストからランダムで記事を投稿する'
task :send_random_item do
  message = IdobataPocket::MessageCreation.create_message
  IdobataPocket::MessageSender.send(message)
end
