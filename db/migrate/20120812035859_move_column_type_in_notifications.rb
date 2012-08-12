class MoveColumnTypeInNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :type
    add_column :notifications,:event_type,:string
  end

end
