class Summary

  attr_accessor :activity_duration, :timeline
  def initialize
    today = Date.today
    @activity_duration = Activity.joins(:activity_type).where(["curr_date = ? and activity_type_id <> 9", today]).group('activity_types.name').sum(:duration)
    @total_hours_worked = Activity.where(["curr_date = ? and activity_type_id <> 9", today]).sum(:duration)
    @in_office_by = Activity.joins(:activity_type).where(["curr_date = ? and name = ?", today, "IN-OFFICE"]).first
    @timeline = Activity.includes(:activity_type).joins(:activity_type).where(["curr_date = ? and end_time is not null and activity_type_id <> 9", today]).load.map{|activity| [activity.activity_name, activity.start_time, activity.end_time]}
  end

end
