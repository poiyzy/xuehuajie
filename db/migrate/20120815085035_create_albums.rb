class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :pictures_count
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
