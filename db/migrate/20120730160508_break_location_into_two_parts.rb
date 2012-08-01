class BreakLocationIntoTwoParts < ActiveRecord::Migration
  def change
    remove_column :profiles,:location
    add_column :profiles,:state,:string
    add_column :profiles,:city,:string
  end

end
