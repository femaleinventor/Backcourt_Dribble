module ApplicationHelper

  def get_unique_users(predictions)
    users = predictions.collect {|prediction| prediction.user}
    users.uniq
  end

  def sort_users_by_points(users)
    users.sort_by{|u| u.points}.reverse
  end

  def ga_script
    tracking_id = "UA-125640699-1"
    if Rails.env.production?
      javascript_tag("(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', '#{tracking_id}', 'auto');")
    end
  end

  def ga_track
    javascript_tag("if(window.ga != undefined){ga('send', 'pageview');}")
  end

  def get_match_offset(match)
    # Gets the total offset of a match start time (utc total offset = std + utc offsets)
    offset_in_hours = (TZInfo::Timezone.get(match.time_zone).current_period.offset.utc_total_offset) / 3600
  end

  def convert_to_match_time_zone(match)
    Time.utc(match.start.year, match.start.month , match.start.day, match.start.hour,match.start.min).in_time_zone(match.time_zone)
  end

  def resource_name
   :user
  end


 def resource
   @resource ||= User.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
 end

end
