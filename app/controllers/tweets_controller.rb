
class TweetsController < ApplicationController

  def index
    p params
    @tweets = params[:keyword].nil? ? [] : TwitterAdapter::search(params[:keyword])
  end

  def create
    p "You're creating"
    p params
    @tweets = params[:keyword].nil? ? [] : TwitterAdapter::search(params[:keyword])
    if request.xhr?
      p "OMG ITS A JSON REQUEST WHOOOOOOOOOOOOOO!"
      @tweets.to_json
    end
    render :_tweet, layout: false
  end

  def show
  end


end
