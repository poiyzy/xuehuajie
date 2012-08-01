class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles,:force => true do |t|
      t.integer :user_id
      t.string :image_url
      t.string :image_url_middle
      t.string :image_url_small
      t.string :gender
      t.date :birthday
      t.text :bio
      t.string :user_name
      t.integer :follower_num
      t.integer :heat
      t.boolean :searchable       ,:default => true
      t.string :location
      t.boolean :account_setted   ,:default => false

      t.timestamps
    end
    add_index :profiles, :user_id
    add_index :profiles, :gender
    add_index :profiles, :user_name
    add_index :profiles, :heat
    add_index :profiles, :searchable
  end
end
