class ActivityType < ActiveRecord::Base

  def self.all_but_in_office
    ActivityType.where.not(:name => 'IN-OFFICE')
  end

  def self.get_in_office_activity
    ActivityType.where(:name => 'IN-OFFICE').first
  end

end
