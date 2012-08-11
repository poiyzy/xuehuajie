class ChangeSomeColumnInNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :user_id
    remove_column :notifications, :object
    remove_column :notifications, :target
    add_column    :notifications, :subject_type, :string
    add_column    :notifications, :actor_type, :string
    add_column    :notifications, :secondary_subject_type, :string
    add_column    :notifications, :actor_id, :integer
    add_column    :notifications, :subject_id, :integer
    add_column    :notifications, :secondary_subject_id, :integer

  end
end
