class AddOverlappingToActivityTypes < ActiveRecord::Migration
  def change
    add_column :activity_types, :overlapping, :boolean
  end
end
