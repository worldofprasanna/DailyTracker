class RemoveActivityTypeFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :activity_type, :string
  end
end
