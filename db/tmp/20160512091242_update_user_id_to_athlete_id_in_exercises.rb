class UpdateUserIdToAthleteIdInExercises < ActiveRecord::Migration
  def change
    remove_reference :exercises, :users
    add_reference :exercises, :athletes, index: true, foreign_key: true
  end
end
