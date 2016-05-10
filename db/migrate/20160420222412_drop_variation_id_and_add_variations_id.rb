class DropVariationIdAndAddVariationsId < ActiveRecord::Migration
  def change
    remove_reference :exercises, :variation
    add_reference :exercises, :variations, index: true, foreign_key: true
  end
end
