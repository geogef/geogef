class CreateMaterialsTable2 < ActiveRecord::Migration[7.1]
  def change  
    add_column :materials, :content, :string
  end
end
