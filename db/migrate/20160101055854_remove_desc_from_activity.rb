class RemoveDescFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :desc, :text
  end
end
