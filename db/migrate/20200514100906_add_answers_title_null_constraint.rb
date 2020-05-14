class AddAnswersTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :title, false)
  end
end
