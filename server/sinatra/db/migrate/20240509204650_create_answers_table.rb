class CreateAnswersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.string :response
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
