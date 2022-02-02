class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :store_id
      t.datetime :datetime
      t.float :amount
      t.integer :purchase_type

      t.timestamps
    end
  end
end
