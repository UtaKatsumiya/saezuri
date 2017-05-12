#!/usr/bin/env ruby
# coding: windows-31j

Dir[File.dirname(__FILE__) + '/sub/*.rb'].each {|file| require file }

require "twitter"
require "optparse"


opt = OptionParser.new
options = {}
opt.on("-u", "--user=TwitterID", "TwitterID"){|v| options[:twitterid] = v}
opt.on("-s", "--sname=ScreanName", "ScreanName"){|v| options[:screanname] = v}
opt.on("-n", "--number=TweetID", "status_id"){|v| options[:tweetid] = v}
opt.on("-t", "--tweet=TweetText", "TweetText"){|v| options[:text] = v}
opt.on("-i", "--image=ImageFile", "ImageFile"){|v| options[:image] = v}
opt.on("-c", "--count=FetchCounts", "FetchCount"){|v| options[:fetchcount] = v}
opt.on("-f"){|v| options[:favflag] = v}
opt.on("-r"){|v| options[:rtflag] = v}
opt.on("-w"){|v| options[:watchflag] = v}
opt.parse!(ARGV)

twitteruser = options[:twitterid]
twitteruser ||= "default_user"
@twitteruser = twitteruser

@screen_name = options[:screanname]

@tweet_id = options[:tweetid]

tweettext = options[:text]
tweettext ||= ARGV[0]
@tweettext = tweettext

@image_directory = options[:image]

fetch_count = options[:fetchcount]
fetch_count ||= 5
@fetch_count = fetch_count

@fav = options[:favflag]
@rt = options[:rtflag]

@watch = options[:watchflag]

if @fav || @rt
  favrt
elsif @screen_name || @watch
  show_timeline
elsif @tweettext
  tweet
else
  msg_check
end
