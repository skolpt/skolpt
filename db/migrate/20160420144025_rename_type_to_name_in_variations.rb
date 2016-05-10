class RenameTypeToNameInVariations < ActiveRecord::Migration
  def change
    rename_column :variations, :type, :name
  end
end
