class RenameExercisesIdInVariations < ActiveRecord::Migration
  def change
    rename_column :variations, :exercises_id, :exercise_id
  end
end
