# frozen_string_literal: true

class CreateOptionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :options do |t|
      t.string :response
      t.references :topics, foreign_key: true
      t.timestamps
    end
  end
end
