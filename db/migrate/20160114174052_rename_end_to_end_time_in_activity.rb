class RenameEndToEndTimeInActivity < ActiveRecord::Migration
  def change
    rename_column :activities, :end, :end_time
  end
end
