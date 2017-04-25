class RenameAthleteTableToUsersTable < ActiveRecord::Migration
  def change
    rename_table :athletes, :users
  end
end
