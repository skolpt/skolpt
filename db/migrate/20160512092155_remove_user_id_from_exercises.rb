class RemoveUserIdFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :user_id
    remove_reference :exercises, :users
  end
end
