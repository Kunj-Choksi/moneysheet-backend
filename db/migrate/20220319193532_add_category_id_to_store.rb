class AddCategoryIdToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :master_stores, :category_id, :integer
  end
end
