class CreateUserMapLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :user_map_levels do |t|
      t.references :map_level, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
