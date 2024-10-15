# frozen_string_literal: true

class AddNameToLevels < ActiveRecord::Migration[7.1]
  def change
    add_column :levels, :name, :string
  end
end
