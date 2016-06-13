class AddFirstNameLastNameToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :first_name, :string
    add_column :athletes, :last_name, :string
  end
end
