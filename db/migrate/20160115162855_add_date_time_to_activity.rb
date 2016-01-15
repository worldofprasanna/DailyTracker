class AddDateTimeToActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :start, :time
    remove_column :activities, :end_time, :time
    add_column :activities, :start_time, :datetime
    add_column :activities, :end_time, :datetime
  end
end
