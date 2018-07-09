class TweetsController < ApplicationController

  def index
    tweet = {
      created_at: "Wed Jul 04 20:50:51 +0000 2018",
      text: "RT @NWSL:  Happy Fourth of July from the #NWSL! https://t.co/AmuIUoBB8O",
      # screen_name: "lostinthegame_",
      location: "Long Islander",
      }
    tweet2 = {
      created_at: "Wed Jul 07 20:00:51 +0000 2018",
      text: "OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG OMG: I LOVE THE SPORTSBALL GAME WITH THE LADIES #GoLadies #GoSportsball",
      # screen_name: "denise_duffy",
      location: "SF",
      }

    @tweets = [tweet, tweet2]
  end

  def show
  end


end
