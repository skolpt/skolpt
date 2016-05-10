class DropExerciseNameFromVariations < ActiveRecord::Migration
  def change
    remove_column :variations, :exercises_name
  end
end
