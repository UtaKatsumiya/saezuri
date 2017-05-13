#!/usr/bin/env ruby
# coding: windows-31j

require "optparse"

class Argument
  attr_accessor :twitterid, :sname, :tweetid, :posttext, :image, :fetchcount, :fav, :rt, :watch

  def initialize
    opt = OptionParser.new
    options = {:twitterid => "Uta_Katsumiya", :fetchcount => 5}

    opt.on("-u", "--user=TwitterID", "TwitterID"){|v| options[:twitterid] = v}
    opt.on("-s", "--sname=ScreenName", "ScreenName"){|v| options[:sname] = v}
    opt.on("-n", "--number=TweetID", "status_id"){|v| options[:tweetid] = v}
    opt.on("-t", "--tweet=TweetText", "TweetText"){|v| options[:posttext] = v}
    opt.on("-i", "--image=ImageFile", "ImageFile"){|v| options[:image] = v}
    opt.on("-c", "--count=FetchCounts", "FetchCount"){|v| options[:fetchcount] = v}
    opt.on("-f"){|v| options[:fav] = v}
    opt.on("-r"){|v| options[:rt] = v}
    opt.on("-w"){|v| options[:watch] = v}
    opt.parse!(ARGV)

    @twitterid = options[:twitterid]
    @sname = options[:sname]
    @tweetid = options[:tweetid]
    options[:posttext] ||= ARGV[0]
    @posttext = options[:posttext]
    @image = options[:image]
    @fetchcount = options[:fetchcount]
    @fav = options[:fav]
    @rt = options[:rt]
    @watch = options[:watch]
  end
end
