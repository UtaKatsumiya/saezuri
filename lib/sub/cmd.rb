#!/usr/bin/env ruby
# coding: windows-31j


class Cmd
  attr_accessor :rtflag, :favflag, :watchflag, :snameflag, :post
  def initialize
    @argument = Argument.new
    token = Token.new(@argument.twitterid)
    @modified = token.login
    @rtflag = @argument.rt
    @favflag = @argument.fav
	@watchflag = @argument.watch
	@snameflag = @argument.sname
	@post = @argument.posttext
  end

  def tweet
    if @argument.image && @argument.tweetid
      @modified.update_with_media(@argument.posttext.dup.encode!("UTF-8"), open(@argument.image), in_reply_to_status_id: @argument.tweetid)
    else
      @modified.update(@argument.posttext.dup.encode!("UTF-8"), in_reply_to_status_id: @argument.tweetid)
   end
  end

  def show_timeline
    unless @argument.sname
      max_id = @modified.home_timeline.first.id
      @modified.home_timeline(max_id: max_id, count: @argument.fetchcount).each do |tweet|
        puts "#{tweet.user.name} @#{tweet.user.screen_name} (id #{tweet.id})"
        puts tweet.full_text
        puts "Fav: #{tweet.favorite_count}, RT: #{tweet.retweet_count} posted at #{tweet.created_at}"
        puts ""
      end
    else
      @modified.user_timeline(@argument.sname, { count: @argument.fetchcount} ).each do |timeline|
      tweet = @modified.status(timeline.id)
        puts "#{tweet.user.name} @#{tweet.user.screen_name} (id #{tweet.id})"
        puts tweet.text
        puts "Fav: #{tweet.favorite_count}, RT: #{tweet.retweet_count} posted at #{tweet.created_at}"
        puts ""
      end
    end
  end

  def msg_check
    mention_max_id = @modified.mentions_timeline.first.id
    @modified.mentions_timeline(max_id: mention_max_id, count: @argument.fetchcount).each do |tweet|
      puts "#{tweet.user.name} @#{tweet.user.screen_name} (id #{tweet.id})"
      puts tweet.full_text
      puts "Fav: #{tweet.favorite_count}, RT: #{tweet.retweet_count} posted at #{tweet.created_at}"
      puts ""
    end
  end

  def favrt
    if @argument.fav && @argument.rt
      @modified.favorite(@argument.tweetid)
      @modified.retweet(@argument.tweetid)
    elsif @argument.fav
      @modified.favorite(@argument.tweetid)
    elsif @argument.rt
      @modified.retweet(@argument.tweetid)
    else
      str = "fav（-f）またはrt（-r）を指定してください"
      puts str
    end
  end
end
