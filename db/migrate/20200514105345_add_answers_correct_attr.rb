class AddAnswersCorrectAttr < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :string, default: 0)
  end
end
