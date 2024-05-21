class AddNewColumnImagespathInQasTable < ActiveRecord::Migration[7.1]
  def change
    add_column :qas, :imagepath, :string
  end
end
