class AdminController < ApplicationController

  def index
    @sports = Sport.all
    @venues = Venue.all
    @leagues = League.all
    @teams = Team.all
    @matches = Match.all
  end
end
