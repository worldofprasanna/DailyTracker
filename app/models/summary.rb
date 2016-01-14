class Summary

  attr_accessor :activity_duration
  def initialize
    today = Date.today
    @activity_duration = Activity.joins(:activity_type).where(["curr_date = ?", today]).group("activity_types.name").sum(:duration)
    @total_hours_worked = Activity.where(["curr_date = ?", today]).sum(:duration)
    @in_office_by = Activity.joins(:activity_type).where(["curr_date = ? and name = ?", today, "IN-OFFICE"]).first.start
  end

end
