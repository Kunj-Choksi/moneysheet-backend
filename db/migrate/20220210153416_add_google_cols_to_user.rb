class AddGoogleColsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :google_uid, :string
    add_column :users, :google_photo_url, :string
  end
end
