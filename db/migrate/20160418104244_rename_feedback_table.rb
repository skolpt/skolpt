class RenameFeedbackTable < ActiveRecord::Migration
  def change
    rename_table :feedback, :feedbacks
  end
end
