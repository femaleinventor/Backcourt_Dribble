class TweetsFetcherWorker
  include Sidekiq::Worker

  def perform(*args)
    
    TwitterAdapter::search()
  end
end
