# frozen_string_literal: true

class CreateQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.references :topic, foreign_key: true
      t.references :exams, foreign_key: true
      t.timestamps
    end
  end
end
