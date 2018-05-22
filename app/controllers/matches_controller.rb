class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @league = params[:id]
  end
end
