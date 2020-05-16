class FixTestsLevelDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :level, from: true, to: false
    add_foreign_key :tests, :categories, column: :title
  end
end
