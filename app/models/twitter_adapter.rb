class TwitterAdapter

  include HttpParty

  base_uri 'api.twitter.com'

  def initialize
    @api_key = ENV['TWITTER_CONSUMER_API_KEY']
  end

  def search(search_string)
    response = self.class.get(/1.1/search/tweets.json?
      { query:
        {
          q: search_string,
          api_key: @api_key
        }
      })

    response["statuses"].map { |result| result["text"] }

  end
