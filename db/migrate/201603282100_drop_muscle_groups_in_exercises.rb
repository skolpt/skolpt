class DropMuscleGroupsInExercises < ActiveRecord::Migration
  def change
    remove_reference :exercises, :muscle_group
  end
end
