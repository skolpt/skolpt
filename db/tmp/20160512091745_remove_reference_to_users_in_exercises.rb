class RemoveReferenceToUsersInExercises < ActiveRecord::Migration
  def change
    remove_reference :exercises, :users
  end
end
