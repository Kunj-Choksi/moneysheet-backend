class TransactionController < ApplicationController

  def retrieve_stores
    @stores = Master::Store.all
    render_result_json @stores
  end
end
