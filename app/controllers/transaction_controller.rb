class TransactionController < ApplicationController

  def retrieve_stores
    @stores = Master::Store.all
    render_result_json @stores
  end

  def add_transaction
    transaction = Transaction.new(
      store_id: params[:store_id],
      datetime: params[:datetime],
      amount: params[:amount],
      purchase_type: params[:purchase_type]
    )

    render_result_message('Added new transaction') if transaction.save
  end
end
