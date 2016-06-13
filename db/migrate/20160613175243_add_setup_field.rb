class AddSetupField < ActiveRecord::Migration
  def change
    add_column :exercises, :setup, :text
  end
end
