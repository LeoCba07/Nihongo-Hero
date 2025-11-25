class CreateMapLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :map_levels do |t|
      t.text :story_content

      t.timestamps
    end
  end
end
