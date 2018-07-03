class Tweet < ApplicationRecord

client = Twitter::REST::Client.new do |config|
config.consumer_key    = "YOUR_CONSUMER_KEY"
config.consumer_secret = "YOUR_CONSUMER_SECRET"
end

# config = {
#   consumer_key:    "YOUR_CONSUMER_KEY",
#   consumer_secret: "YOUR_CONSUMER_SECRET",
# }
#
# client = Twitter::REST::Client.new(config)



# client.user("backcourtdribbl")

# puts client.bearer_token

  # client.search("to:USWNT", result_type: "recent").take(5).each
  #   do |tweet|
  #     puts tweet.text
  # end

end
