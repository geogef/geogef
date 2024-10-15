class CreateQasTable < ActiveRecord::Migration[7.1]
  def change
    create_table :qas do |t|
      t.references :questions
      t.references :options
      t.timestamps
    end
  end
end
