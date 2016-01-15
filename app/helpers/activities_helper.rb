module ActivitiesHelper
  def get_activity_name(activity)
    return 'No Activity' if activity.nil?
    activity.activity_name
  end

  def get_activity_start_time(activity)
    return '-' if activity.nil?
    activity.activity_start_time
  end

end
