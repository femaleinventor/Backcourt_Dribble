class VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to admin_index_path, alert: "Venue created successfully!"
    else
        redirect_to admin_index_path, alert: "Oops! The venue wasn't recorded. Try again!"
    end
  end

  private
    def venue_params
      params.permit(:name, :image_url, :address, :time_zone)
    end
end
