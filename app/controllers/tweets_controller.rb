class TweetsController < ApplicationController

  def index
  end

  def show
  end

  client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "YOUR_CONSUMER_KEY"
  config.consumer_secret = "YOUR_CONSUMER_SECRET"

  client.search("to:USWNT", result_type: "recent").take(3).each do |tweet|
    puts tweet.text
  end

end
