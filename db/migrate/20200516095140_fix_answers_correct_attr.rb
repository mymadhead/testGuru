class FixAnswersCorrectAttr < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :correct, :boolean, default: 0, null: false
    add_foreign_key :answers, :questions, column: :title
  end
end
