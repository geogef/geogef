class CreateLearningsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :learnings do |t|
      t.integer :section
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
