# frozen_string_literal: true

class CreateTopicsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :topic
      t.timestamps
    end
  end
end
