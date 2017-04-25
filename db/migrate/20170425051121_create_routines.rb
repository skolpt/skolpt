class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :title
      t.string :description
      t.string :difficulty
      t.integer :user_id
      t.timestamps
    end
  end
end
