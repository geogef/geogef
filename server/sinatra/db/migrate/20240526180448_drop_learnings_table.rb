# frozen_string_literal: true

class DropLearningsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :learnings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
