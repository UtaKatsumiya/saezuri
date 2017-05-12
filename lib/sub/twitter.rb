#!/usr/bin/env ruby
# coding: windows-31j

require "yaml"
require "twitter"

class Token
  def initialize(twitterid)
    key = YAML.load_file(File.dirname(__FILE__) + "./" + twitterid + ".yml")
    @access_token = key["access_token"]
    @token_secret = key["access_token_secret"]
  end

  def login
    api = YAML.load_file(File.dirname(__FILE__) + "./config.yml")
    modified = Twitter::REST::Client.new do |config|
      config.consumer_key = api["api_key"]
      config.consumer_secret = api["api_secret"]
      config.access_token        = @access_token
      config.access_token_secret = @token_secret
    end
  end
end
