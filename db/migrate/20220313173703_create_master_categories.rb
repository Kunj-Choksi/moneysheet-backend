class CreateMasterCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :master_categories do |t|
      t.string :name
      t.integer :status_id

      t.timestamps
    end
  end
end
