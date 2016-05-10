class AddExerciseNameToVariations < ActiveRecord::Migration
  def change
    add_column :variations, :exercises_name, :string
  end
end
