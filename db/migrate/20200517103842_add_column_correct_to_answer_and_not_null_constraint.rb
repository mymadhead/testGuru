class AddColumnCorrectToAnswerAndNotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean, null: false, default: false
  end
end
