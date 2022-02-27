class AddCommentsToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :comments, :text
  end
end
