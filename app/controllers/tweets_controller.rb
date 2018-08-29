class TweetsController < ApplicationController

  def index
    @tweets = params[:keyword].nil? ? [] : TwitterAdapter::search(params[:keyword])
  end

  def create
    @search_string = params[:keyword]
    @tweets = TwitterAdapter::search(@search_string)
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
