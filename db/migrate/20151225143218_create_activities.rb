class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :desc
      t.time :start
      t.time :end
      t.string :type

      t.timestamps null: false
    end
  end
end
