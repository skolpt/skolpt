class AddMuscleGroupsIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :muscle_groups, index: true, foreign_key: true
  end
end
