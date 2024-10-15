class RemoveLearningIdFromMaterials < ActiveRecord::Migration[7.1]
  def change
      remove_column :materials, :learning_id
  end
end
