class Activity < ActiveRecord::Base
  belongs_to :activity_type

  default_value_for :curr_date do
    Date.today
  end
end
