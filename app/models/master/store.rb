class Master::Store < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :logo_url, presence: true, length: {minimum: 3}
  validates :category_id, presence: true
  
  belongs_to :master_category, :class_name => 'Master::Category', foreign_key: :category_id
end
