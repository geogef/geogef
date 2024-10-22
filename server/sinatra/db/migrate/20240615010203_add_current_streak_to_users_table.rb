# frozen_string_literal: true

class AddCurrentStreakToUsersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :current_streak, :integer
  end
end
