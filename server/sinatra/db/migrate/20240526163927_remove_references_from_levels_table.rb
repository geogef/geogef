# frozen_string_literal: true

class RemoveReferencesFromLevelsTable < ActiveRecord::Migration[7.1]
  def change
    remove_reference :levels, :exam, foreign_key: true
    remove_reference :levels, :learnings, foreign_key: true
  end
end
