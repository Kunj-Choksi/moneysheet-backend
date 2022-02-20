class TransactionController < ApplicationController

  def retrieve_stores
    stores = Master::Store.all
    render_result_json stores
  end

  def retrieve_transactions
    transactions = Transaction.includes(:master_store).by_month(params[:periodMonth], year: params[:periodYear], field: :datetime).all
    render_result_json transactions
  end

  def add_transaction
    transaction = Transaction.new(
      user_id: params[:user_id],
      store_id: params[:store_id],
      datetime: params[:datetime],
      amount: params[:amount],
      purchase_type: params[:purchase_type]
    )

    render_result_message('Added new transaction') if transaction.save
  end
end