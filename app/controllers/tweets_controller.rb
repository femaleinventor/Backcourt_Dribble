class TweetsController < ApplicationController

  def index
    p params
    @tweets = params[:keyword].nil? ? [] : TwitterAdapter::search(params[:keyword])
  end

  def create
    p "You're creating"
    p params
    @tweets = TwitterAdapter::search(params[:keyword])
    if request.xhr?
      p "OMG ITS A JSON REQUEST WHOOOOOOOOOOOOOO!"
      p @tweets
      render json: @tweets.to_json
    else
      render :_tweet, layout: false
    end
  end

  def show
  end


end
