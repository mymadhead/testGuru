class RemoveSuccessColumnFromTestPassages < ActiveRecord::Migration[6.0]
  def change
    remove_column :test_passages, :success
  end
end
