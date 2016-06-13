class AddPictureToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :picture, :string
  end
end
