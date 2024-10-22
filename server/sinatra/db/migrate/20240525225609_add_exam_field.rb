# frozen_string_literal: true

class AddExamField < ActiveRecord::Migration[7.1]
  def change
    add_reference :qas, :exam, foreign_key: true
  end
end
