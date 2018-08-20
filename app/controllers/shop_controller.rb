class ShopController < ApplicationController
  def index
    @sports = Sport.all
  end
end
