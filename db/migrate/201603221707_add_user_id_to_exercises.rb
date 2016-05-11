class AddUserIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :athletes, index: true, foreign_key: true
  end
end
