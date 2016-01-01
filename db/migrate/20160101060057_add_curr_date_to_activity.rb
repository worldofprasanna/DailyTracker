class AddCurrDateToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :curr_date, :date
  end
end
