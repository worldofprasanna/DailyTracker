class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end

  def self.fetch_all_open_activity
    Activity.where(:end => nil).order(created_at: :desc).load
  end

  def save_and_close_prev
    curr_activity = Activity.fetch_current_activity
    curr_activity.close(self.start) unless curr_activity.nil? || curr_activity.is_overlapping_allowed
    self.save
  end

  def close(end_time)
    self.end = end_time
    self.save
  end

  def self.fetch_current_activity
    Activity.fetch_all_open_activity.first
  end

  def is_overlapping_allowed
    self.activity_type.overlapping
  end
end
