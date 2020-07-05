class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, null: true, foreign_key: {to_table: :users}
  end
end