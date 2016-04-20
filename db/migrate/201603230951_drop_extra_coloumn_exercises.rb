class DropExtraColoumnExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :category_id
  end
end
