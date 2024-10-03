class AddTypeToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_type, :integer, default: 0 
  end
end
