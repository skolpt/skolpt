class AddBylineToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :byline, :string
  end
end
