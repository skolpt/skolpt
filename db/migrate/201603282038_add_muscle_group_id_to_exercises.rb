class AddMuscleGroupIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :muscle_group, index: true, foreign_key: true
  end
end
