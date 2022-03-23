class TransactionController < ApplicationController
  before_action :session_client

  def retrieve_stores
    stores = Master::Store.all
    render_result_json stores
  end

  def retrieve_transactions
    map = {}
    transactions = Transaction.includes(:master_store).by_month(params[:periodMonth], year: params[:periodYear], field: :datetime).all.order("datetime DESC")
    map["transactions"] = transactions
    map["category_wise"] = []

	Master::Category.all.each do |mc|
		values = []
		values << mc.name
		values << transactions.where("master_stores.category_id = ?", mc.id).sum(:amount)

		map["category_wise"] << values
	end

    render_result_json map
  end

  def add_transaction
    transaction = Transaction.new(
      client_id: params[:client_id],
      store_id: params[:store_id],
      datetime: params[:datetime],
      amount: params[:amount],
      purchase_type: params[:purchase_type],
      comments: params[:comments]
    )

    render_result_message('Added new transaction') if transaction.save
  end
end
