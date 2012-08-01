class BreakLocationIntoTwoParts < ActiveRecord::Migration
  def change
    remove_column :profiles,:location
    add_column :profiles,:state,:string
    add_column :profiles,:city,:string
    add_column :profiles, :school,:string
    remove_column :profiles,:account_setted
    add_column :users, :getting_started,:boolean,:default => false
    
  end

end
