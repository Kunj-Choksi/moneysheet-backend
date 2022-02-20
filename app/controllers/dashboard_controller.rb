class DashboardController < ApplicationController
    def retrieve_dashboard_data
        transactions = Transaction.includes(:master_store).where(user_id: params[:user_id])
        map = {}

        map['overall'] = transactions
        map['this_week'] = transactions.by_week
        map['this_month'] = transactions.by_month
        map['this_month_spending'] = transactions.by_month.sum(:amount)
        render_result_json map
    end
end
