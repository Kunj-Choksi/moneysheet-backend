class Master::Category < ApplicationRecord
  validates :name, presence: true
  validates :status_id, presence: true
end
