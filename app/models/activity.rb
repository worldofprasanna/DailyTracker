class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end

  scope :fetch_all_open_activity, -> { where(end_time: nil).joins(:activity_type).where.not(activity_types: { name: 'IN-OFFICE' }) }
  scope :fetch_in_office_activity, -> { where(curr_date: Date.today).where(end_time: nil).joins(:activity_type).where(activity_types: { name: 'IN-OFFICE' }) }

  def save_and_close_prev(time)
    curr_activity = Activity.fetch_current_activity
    curr_activity.close(time) unless curr_activity.nil? || curr_activity.is_overlapping_allowed
    Activity.create_in_office(self.start_time)
    self.duration=1
    self.save
  end

  def self.create_in_office(start_time)
    in_office_activity = Activity.fetch_in_office_activity
    if in_office_activity.nil? then
      in_office_activity = Activity.new
      in_office_activity.start_time= start_time
      in_office_activity.activity_type = ActivityType.get_in_office_activity
      in_office_activity.save
    end
  end

  def close(end_time)
    self.end_time = end_time
    self.duration = calculate_duration(self.start_time, self.end_time)
    self.save
  end

  def update_activity(params)
    self.end_time = params[:end_time]
    self.duration = calculate_duration(self.start_time, self.end_time)
    self.save_and_close_prev(self.end_time)
    self.update(params)
  end

  def self.fetch_current_activity
    fetch_all_open_activity.first
  end

  def is_overlapping_allowed
    self.activity_type.overlapping
  end

  def activity_name
    if self.activity_type.nil? then
      'No Activity'
    else
      self.activity_type.name
    end
  end

  def activity_start_time
    if self.start_time.nil? then
      '-'
    else
      self.start_time.strftime("%H:%M (Hour:Min)")
    end
  end

  def self.activity_summary
    Summary.new
  end

  private
  def calculate_duration(start_time, end_time)
    ((end_time - start_time) / 1.minute).round
  end
end
