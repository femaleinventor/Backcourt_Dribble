class DribbleController < ApplicationController

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    # doesnt work
    if !current_user
      render :new_user_registration
    end
  end
end
