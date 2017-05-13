#!/usr/bin/env ruby
# coding: windows-31j

Dir[File.dirname(__FILE__) + '/sub/*.rb'].each {|file| require file }


cmd = Cmd.new
argument = Argument.new

if cmd.rtflag || cmd.favflag
  cmd.favrt
elsif cmd.watchflag || cmd.snameflag
  cmd.show_timeline
elsif cmd.post
  cmd.tweet
else
  cmd.msg_check
end
