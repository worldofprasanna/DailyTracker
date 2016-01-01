class AddKeystrokeToActivityType < ActiveRecord::Migration
  def change
    add_column :activity_types, :keystroke, :integer
  end
end
