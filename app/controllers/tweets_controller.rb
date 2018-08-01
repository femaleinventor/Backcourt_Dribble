class TweetsController < ApplicationController

  def index
    @tweets = params[:keyword].nil? ? [] : TwitterAdapter::search(params[:keyword])
  end

  def create
    @search_string = params[:keyword]
    @tweets = TwitterAdapter::search(@search_string)
  end

  def show
  end


end
