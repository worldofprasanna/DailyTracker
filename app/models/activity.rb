class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end

  def self.fetch_all_open_activity
    Activity.where(:end => nil).order(created_at: :desc).load
  end
end
