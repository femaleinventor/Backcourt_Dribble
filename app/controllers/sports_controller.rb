class SportsController < ApplicationController

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    if !current_user
      render :new_user_registration
    end
    @sports = Sport.all
  end

end
