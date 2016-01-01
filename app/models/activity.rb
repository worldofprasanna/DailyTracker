class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end

  def self.current_activity
    Activity.where(:end => nil).order(created_at: :desc).first
  end
end
