# frozen_string_literal: true

class CreateLearningsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :learnings do |t|
      t.references :level, foreign_key: true
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
