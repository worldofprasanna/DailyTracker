class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end

  def self.fetch_all_open_activity
    Activity.where(:end_time => nil).order(created_at: :desc).load
  end

  def self.fetch_in_office_activity
    in_office_activity = Activity.where(:activity_type_id => 1, :curr_date => Date.today).first
    if in_office_activity.nil? then
      in_office_activity = Activity.new
    end
    in_office_activity
  end

  def save_and_close_prev
    curr_activity = Activity.fetch_current_activity
    curr_activity.close(self.start_time) unless curr_activity.nil? || curr_activity.is_overlapping_allowed
    self.save
  end

  def close(end_time)
    self.end_time = end_time
    self.duration = ((self.end_time - self.start_time) / 1.minute).round
    self.save
  end

  def self.fetch_current_activity
    current_activity = Activity.fetch_all_open_activity.first
    if current_activity.nil?
      current_activity = Activity.new
    end
    current_activity
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
end
