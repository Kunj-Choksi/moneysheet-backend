class TransactionController < ApplicationController
  before_action :session_client

  def retrieve_stores
    stores = Master::Store.all
    render_result_json stores
  end

  def retrieve_transactions
    transactions = Transaction.by_month(params[:periodMonth], year: params[:periodYear], field: :datetime).all.order("datetime DESC")

    sql = "SELECT mc.name, SUM(t.amount) total
                FROM transactions t
                INNER JOIN master_stores ms 
                ON ms.id = t.store_id 
                INNER JOIN master_categories mc 
                ON ms.category_id = mc.id
                WHERE 
                EXTRACT(MONTH FROM t.datetime) = #{params[:periodMonth]}
                GROUP BY mc.name
                ORDER BY total;" 
    map = {}
    map["transactions"] = transactions
    map['categories_analysis'] = ActiveRecord::Base.connection.execute(sql).values rescue nil

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
