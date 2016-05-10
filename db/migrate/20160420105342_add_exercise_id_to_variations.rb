class AddExerciseIdToVariations < ActiveRecord::Migration
  def change
    add_reference :variations, :exercises, index: true, foreign_key: true
  end
end
