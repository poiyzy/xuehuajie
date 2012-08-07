class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message
      t.string :type
      t.string :object
      t.string :target

      t.timestamps
    end
  end
end
