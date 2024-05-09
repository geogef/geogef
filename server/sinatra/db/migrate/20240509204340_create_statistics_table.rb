class CreateStatisticsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :user_statistics do |t|
      t.integer :user_id
      t.date :registration_date
      t.float :app_progress
      t.integer :highest_streak
      t.integer :completed_lessons
      t.integer :total_score
      t.timestamps
    end
  end
end
