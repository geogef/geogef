# frozen_string_literal: true

class ChangeReferencesNamesInLessonsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :lessons, :topics_id, :topic_id
    rename_column :lessons, :lessons_id, :lesson_id
  end
end
