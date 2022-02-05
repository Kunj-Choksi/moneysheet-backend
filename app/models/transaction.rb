class Transaction < ApplicationRecord
  belongs_to :master_store, class_name: "Master::Store", foreign_key: :store_id

  def as_json(options = nil)
    super(options).merge({
      'store' => self.master_store
    })
  end
end
