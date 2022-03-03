class DashboardController < ApplicationController
  before_action :session_client

  def retrieve_dashboard_data
    transactions = Transaction.includes(:master_store).where(client_id: params[:client_id]).order("datetime DESC")
    map = {}

    map['overall'] = transactions
    map['this_week'] = transactions.by_week(field: :datetime)
    map['this_month'] = transactions.by_month(field: :datetime)
    map['this_month_spending'] = transactions.by_month(field: :datetime).sum(:amount)
    render_result_json map
  end
end
