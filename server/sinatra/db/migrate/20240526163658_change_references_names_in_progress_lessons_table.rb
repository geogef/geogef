# frozen_string_literal: true

class ChangeReferencesNamesInProgressLessonsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :progress_lessons, :users_id, :user_id
    rename_column :progress_lessons, :lessons_id, :lesson_id
    rename_column :progress_lessons, :levels_id, :level_id
  end
end
