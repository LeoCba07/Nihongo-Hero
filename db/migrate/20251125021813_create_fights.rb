class CreateFights < ActiveRecord::Migration[7.1]
  def change
    create_table :fights do |t|
      t.references :user_map_level, null: false, foreign_key: true
      t.string :status
      t.string :enemy_name
      t.string :enemy_sprite
      t.integer :enemy_hitpoints
      t.integer :player_hitpoints

      t.timestamps
    end
  end
end
