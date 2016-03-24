class ActivityType < ActiveRecord::Base

  has_many :activities

  scope :all_but_in_office, -> { where.not(name: 'IN-OFFICE') }
  scope :get_in_office_activity, -> { where(name: 'IN-OFFICE') }

end
