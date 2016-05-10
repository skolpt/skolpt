class DropVariationsIdReferenceFromExercise < ActiveRecord::Migration
  def change
    remove_reference :exercises, :variations
  end
end
