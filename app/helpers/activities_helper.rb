module ActivitiesHelper
  def get_activity_name(activity)
    return 'No Activity' if activity.nil?
    activity.activity_name
  end

  def get_activity_start_time(activity)
    return '-' if activity.nil?
    activity.activity_start_time
  end

  def draw_timeline_chart(time_line)
    # binding.pry
    if time_line.size == 0
      chart = (timeline [['NO-DATA', '00:00'.to_time, '01:00'.to_time]])
    elsif
      chart = (timeline time_line)
    end
    chart
  end

  def draw_summary_chart(activity_duration)
    if activity_duration.size == 0
      start_data = {'NO-DATA' => 30}
      chart = (pie_chart start_data)
    elsif
      chart = (pie_chart activity_duration)
    end
    chart
  end

end
