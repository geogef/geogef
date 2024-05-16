class CreateRewardsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost
      t.timestamps
    end
  end
end
