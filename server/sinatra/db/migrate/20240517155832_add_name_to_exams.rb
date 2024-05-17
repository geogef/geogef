class AddNameToExams < ActiveRecord::Migration[7.1]
  def change
    add_column :exams, :name, :string
  end
end
