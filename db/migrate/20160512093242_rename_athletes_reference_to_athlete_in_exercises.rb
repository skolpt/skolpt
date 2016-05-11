class RenameAthletesReferenceToAthleteInExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :athletes_id
    remove_reference :exercises, :athletes
    add_reference :exercises, :athlete, index: true, foreign_key: true
  end
end
