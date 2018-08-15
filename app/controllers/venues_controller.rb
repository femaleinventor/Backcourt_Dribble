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

  def show
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(update_venue_params)
        redirect_to venue_path(@venue), alert: "Venue updated successfully!"
    else
        redirect_to venue_path(@venue), alert: "Oops! Your update to #{@venue.name} wasn't recorded. Try again!"
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    if @venue.destroy
      redirect_to admin_index_path
    else
      redirect_to venue_path(@venue), alert: "Oops! #{@venue.name} wasn't deleted. Try again!"
    end
  end

  private
    def venue_params
      params.require(:venue).permit(:name, :image_url, :address, :time_zone)
      # params.permit(:name, :image_url, :address, :time_zone)
    end

    def update_venue_params
      params.require(:venue).permit(:name, :image_url, :address, :time_zone)
    end
end
