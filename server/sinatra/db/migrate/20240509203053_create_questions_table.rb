class CreateQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.references :exam, foreign_key: true
      t.timestamps
    end
  end
end