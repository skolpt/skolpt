class AddCategoryIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :category_id, :integer, default: false
    add_reference :exercises, :categories, index: true, foreign_key: true
  end
end
