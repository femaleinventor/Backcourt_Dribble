module TwitterAdapter

  def self.search(search_string)

    bearer_token = generate_bearer_token
    search_string.gsub(/\s+/, "%20")

    # URL = https://api.twitter.com... (Key is "how to find resource")
    # URN = tweets.json (What the thing is that we're actually looking for)
    # URI = Both of the above since they both describe the resource we're trying to retrieve

    url = URI("https://api.twitter.com/1.1/search/tweets.json?q=%2523#{search_string}&result_type=recent&tweet_mode=extended")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    # DON'T DO THIS IN PRACTICE!!
    # Should be something more like...
    #
    # http.use_ssl = true
    # pem = File.read("/path/to/my.pem")
    # http.cert = OpenSSL::X509::Certificate.new(pem)
    # http.key  = OpenSSL::PKey::RSA.new(pem)
    # http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{bearer_token}"

    # binding.pry

    response = JSON.parse(http.request(request).read_body)["statuses"].map { |result| result }

  end

private

  def self.generate_bearer_token

    url = URI("https://api.twitter.com/oauth2/token")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
    consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]

    bearer_token_credentials = Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")

    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Basic #{bearer_token_credentials}"
    request["content-type"] = 'application/x-www-form-urlencoded;charset=UTF-8'
    request.body = "grant_type=client_credentials"

    response = JSON.parse http.request(request).read_body
    response["access_token"]

  end

end









# twitter gem stuff

# client = Twitter::REST::Client.new do |config|
# config.consumer_key    = "YOUR_CONSUMER_KEY"
# config.consumer_secret = "YOUR_CONSUMER_SECRET"
# end

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
