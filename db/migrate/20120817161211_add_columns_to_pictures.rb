class AddColumnsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :cover, :boolean,   :default => false
    add_index :pictures, :cover
  end
end
