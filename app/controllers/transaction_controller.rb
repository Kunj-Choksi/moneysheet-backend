class TransactionController < ApplicationController
  before_action :session_client

  def retrieve_stores
    stores = Master::Store.all
    render_result_json stores
  end

  def retrieve_transactions
    transactions = Transaction.joins("LEFT JOIN master_stores ON master_stores.id = transactions.store_id LEFT JOIN master_categories ON master_categories.id = master_stores.id")
                                                .includes(master_store: :master_category)
                                                .by_month(params[:periodMonth], year: params[:periodYear], field: :datetime)
                                                .all.order("datetime DESC")
    map = {}
    map["transactions"] = transactions
    categories = Master::Category.all
    
    map['categories_analysis'] = {}
    categories.each do |cat|
        unless map['categories_analysis'][cat.name].present?
            map['categories_analysis'][cat.name] = 0
        end

        map['categories_analysis'][cat.name] = transactions.where("master_categories.id = ?", cat.id).sum(:amount) rescue nil
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
