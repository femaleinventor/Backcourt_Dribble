class AdminController < ApplicationController
  def index
    @sports = Sport.all
    puts @sports
  end
end
