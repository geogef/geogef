class AddImagepathToMaterials < ActiveRecord::Migration[7.1]
  def change
    add_column :materials, :imagepath, :string  end
end
