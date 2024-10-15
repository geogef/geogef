class CreateLevelsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :levels do |t|
      t.integer :number
      t.references :exam, foreign_key: true
      t.references :lesson, foreign_key: true
      t.references :learnings, foreign_key: true
      t.timestamps
    end
  end
end
