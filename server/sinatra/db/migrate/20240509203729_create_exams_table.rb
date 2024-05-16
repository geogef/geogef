class CreateExamsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.integer :duration
      t.references :lesson ,foreign_key: true
      t.references :level ,foreign_key: true
      t.timestamps
    end
  end
end
