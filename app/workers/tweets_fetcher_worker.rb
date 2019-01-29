class TweetsFetcherWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
<<<<<<< HEAD
    keyword = fetch_keyword
    tweets = TwitterAdapter::search(keyword.word)
    parse(tweets)
    set_keyword_runtime(keyword)
=======
    @keyword = fetch_keyword
    tweets = TwitterAdapter::search(@keyword.word)
    puts "%" * 200
    puts @keyword.word
    parse(tweets)
    set_keyword_runtime(@keyword)
>>>>>>> 92864b9282971cdd44afdfdac3def99eedfe8086
  end

  def fetch_keyword
    if Keyword.where(runtime: nil).any?
      keyword = Keyword.where(runtime: nil).first
    else
      keyword = Keyword.order(runtime: :asc).first
    end
  end

  def parse(tweets)
    tweets.each do |tweet|
      record(tweet)
    end
  end #def parse(tweets)

  def record(tweet)
    record(tweet["quoted_status"]) if tweet["quoted_status"] #Recursive recording of quoted tweets ahead recording main tweet.

    twt = Tweet.find_or_initialize_by(tweet_id: tweet["id"])

    if twt.id
      puts "Tweet already on record."
    else
      user = TwitterUser.find_or_initialize_by(twitter_id: tweet["user"]["id"])
      if user.id == nil
<<<<<<< HEAD
        add_user_args(user, tweet["user"])
      end
=======
        puts "Recording new user."
        add_user_args(user, tweet["user"])
      end
      puts "Recording new tweet."
>>>>>>> 92864b9282971cdd44afdfdac3def99eedfe8086
      add_tweet_args(twt, user, tweet)
    end

  end #def record(tweet)

  def add_tweet_args(twt, user, args)
    twt.update!(
      tweet_id: args["id"],
      tweet_id_str: args["id_str"],
      created: args["created_at"],
      full_text: args["full_text"],
      favorite_count: args["favorite_count"],
      retweet_count: args["retweet_count"],
      source: args["source"],
      statuses_count: args["user"]["statuses_count"],
<<<<<<< HEAD
      twitter_user: user
=======
      twitter_user: user,
      searched_term: @keyword.word
>>>>>>> 92864b9282971cdd44afdfdac3def99eedfe8086
    )

    if args["quoted_tweet"]
      twt.update!(
        quoted_tweet: Tweet.where(
          twitter_id: tweet["quoted_status"]["id"]
        )
      )
    end

  end #def add_tweet_args(twt, user, args)

  def add_user_args(user, args)
    user.update!(
      twitter_id: args["id"],
      created: args["created_at"],
      description: args["description"],
      followers_count: args["followers_count"],
      location: args["location"],
      name: args["name"],
      screen_name: args["screen_name"],
      profile_image: args["profile_image_url"],
      time_zone: args["time_zone"],
      verified: args["verified"]
    )
  end

  def set_keyword_runtime(kw)
    kw.runtime = DateTime.now
    kw.save!
  end

end
