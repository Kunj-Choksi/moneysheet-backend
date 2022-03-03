class RenameColUserToClientInTransaction < ActiveRecord::Migration[7.0]
    def change
        rename_column :transactions, :user_id, :client_id
    end
end
