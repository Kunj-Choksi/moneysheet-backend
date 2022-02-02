class CreateMasterStores < ActiveRecord::Migration[7.0]
  def change
    create_table :master_stores do |t|
      t.string :name
      t.integer :status_id
      t.string :logo_url

      t.timestamps
    end
  end
end
