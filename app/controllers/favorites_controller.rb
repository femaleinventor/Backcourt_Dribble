class FavoritesController < ApplicationController

  def new
    @teams = Team.all
    @sports = Sport.all
    @players = Player.all
    @favorite = Favorite.new
  end
end
