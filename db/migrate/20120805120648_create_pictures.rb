class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :gid
      t.string :description
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :pictures, :gid
  end
end
