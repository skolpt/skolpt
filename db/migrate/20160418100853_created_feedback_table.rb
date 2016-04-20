class CreatedFeedbackTable < ActiveRecord::Migration
  def change
    create_table :feedback do |t|
      t.string :name
      t.string :email
      t.string :type_of_feedback
      t.string :summary
      t.boolean :actioned
      
      t.timestamps
    end
  end
end
