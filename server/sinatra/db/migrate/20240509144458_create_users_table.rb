class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.float :app_progress
      t.integer :highest_streak
      t.integer :completed_lessons
      t.integer :geogems

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
