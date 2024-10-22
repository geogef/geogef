# frozen_string_literal: true

class CreateMaterialsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :content
      t.references :level, foreign_key: true
      t.timestamps
    end
  end
end
