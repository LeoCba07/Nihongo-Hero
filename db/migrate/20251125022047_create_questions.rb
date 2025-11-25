class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :type
      t.string :question
      t.string :answers, array: true, default: []
      t.integer :correct_index

      t.timestamps
    end
  end
end
