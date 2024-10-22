# frozen_string_literal: true

class CreateProgressLessonsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :progress_lessons do |t|
      t.references :users, foreign_key: true
      t.references :lessons, foreign_key: true
      t.references :levels, foreign_key: true
    end
  end
end
