class AddVariationIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :variation, index: true, foreign_key: true
  end
end
