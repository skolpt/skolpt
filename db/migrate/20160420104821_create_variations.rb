class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.string :type
      t.text :description
    end
  end
end