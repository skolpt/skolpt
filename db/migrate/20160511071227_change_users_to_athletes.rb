class ChangeUsersToAthletes < ActiveRecord::Migration
  def change
    rename_table :users, :athletes
  end
end
