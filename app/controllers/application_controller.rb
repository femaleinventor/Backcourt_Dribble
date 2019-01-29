class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?

  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :danger, :info, :warning, :success

  before_action :get_all_sports

  protected

  def authenitcate_admin
    return unless current_user.admin
    redirect_to root_path
  end

  def get_match_offset(match)
    # Gets the total offset of a match start time (utc total offset = std + utc offsets)
    offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :terms_of_service, :time_zone])
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  private

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end

    def get_all_sports
      @sports = Sport.all
    end
  # end
end
