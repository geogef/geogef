class CreateLessonsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :topic
      t.references :exam, foreign_key: true
      t.timestamps
    end
  end
end
