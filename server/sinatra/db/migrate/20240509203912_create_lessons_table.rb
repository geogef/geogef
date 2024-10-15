# frozen_string_literal: true

class CreateLessonsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.references :topics, foreign_key: true
      t.references :lessons, foreign_key: true
      t.timestamps
    end
  end
end
