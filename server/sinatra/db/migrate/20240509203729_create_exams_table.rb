class CreateExamsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.integer :duration
      t.integer :correct_answers
      t.timestamps
    end
  end
end
