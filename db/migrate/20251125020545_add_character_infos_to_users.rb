class AddCharacterInfosToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :character_name, :string
    add_column :users, :hitpoints, :integer
    add_column :users, :experience_points, :integer
    add_column :users, :level, :integer
  end
end
