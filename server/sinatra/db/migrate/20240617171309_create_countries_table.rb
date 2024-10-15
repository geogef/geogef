# frozen_string_literal: true

class CreateCountriesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :flag_url
      t.integer :population
      t.float :surface_area
      t.string :capital
      t.string :currency
      t.string :languages
      t.text :interesting_fact

      t.timestamps
    end
  end
end
