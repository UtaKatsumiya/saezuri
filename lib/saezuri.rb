#!/usr/bin/env ruby
# coding: windows-31j

Dir[File.dirname(__FILE__) + '/sub/*.rb'].each {|file| require file }


cmd = Cmd.new
argument = Argument.new

if argument.rt || argument.fav
  cmd.favrt
elsif argument.watch || argument.sname
  cmd.show_timeline
elsif argument.text
  cmd.tweet
else
  cmd.msg_check
end
