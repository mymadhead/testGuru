class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :url
      t.string "rule_name"
      t.string "rule_value"

      t.timestamps
    end
  end
end
