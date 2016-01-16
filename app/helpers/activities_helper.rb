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
    if time_line.size == 0
      chart_data = [['NO-DATA', '00:00'.to_time, '01:00'.to_time]]
    elsif
      chart_data = time_line
    end
    timeline chart_data
  end

  def draw_summary_chart(activity_duration)
    if activity_duration.size == 0
      chart_data = {'NO-DATA' => 30}
    elsif
      chart_data = activity_duration
    end
    pie_chart chart_data
  end

end
