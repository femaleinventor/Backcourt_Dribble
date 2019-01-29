class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @sports =  Sport.all
  end

end
