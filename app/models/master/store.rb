class Master::Store < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :logo_url, presence: true, length: {minimum: 3}
end
