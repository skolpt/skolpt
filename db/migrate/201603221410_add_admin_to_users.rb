class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :athletes, :admin, :boolean, default: false
  end
end
