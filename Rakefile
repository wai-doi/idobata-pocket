require 'dotenv/load'
require 'rake'
require 'pry-byebug'
require_relative 'lib/idobata_pocket'

desc 'idobataにpocketのリストからランダムで記事を投稿する'
task :send_random_item do
  message = IdobataPocket::MessageCreater.new.message
  IdobataPocket::MessageSender.new.send(message)
end
