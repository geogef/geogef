class AddLastConnectionToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :last_connection, :datetime
  end
end
