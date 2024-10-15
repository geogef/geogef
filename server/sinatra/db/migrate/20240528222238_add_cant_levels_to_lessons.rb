class AddCantLevelsToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :num_levels, :integer
  end
end
