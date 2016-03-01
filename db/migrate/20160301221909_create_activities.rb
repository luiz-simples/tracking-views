class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :cid
      t.string :reference

      t.timestamps null: false
    end
  end
end
