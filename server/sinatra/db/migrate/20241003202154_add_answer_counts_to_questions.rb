class AddAnswerCountsToQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :questions, :correct_answers_count, :integer, default: 0, null: false
    add_column :questions, :incorrect_answers_count, :integer, default: 0, null: false
  end
end
