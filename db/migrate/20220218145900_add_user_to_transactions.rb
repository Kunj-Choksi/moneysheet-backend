class AddUserToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :user_id, :string 
  end
end
