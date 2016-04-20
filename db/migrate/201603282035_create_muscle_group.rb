class CreateMuscleGroup < ActiveRecord::Migration
  def change
    create_table :muscle_group do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
