class CreateBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users do |t|
      t.bigint "user_id", null: false
      t.bigint "badge_id", null: false

      t.timestamps
    end
  end
end
