# frozen_string_literal: true

class AddIsCompletedToProgressLesson < ActiveRecord::Migration[7.1]
  def change
    add_column :progress_lessons, :is_completed, :boolean, default: false
  end
end
