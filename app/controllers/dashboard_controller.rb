class DashboardController < ApplicationController
  before_action :session_client

  def retrieve_dashboard_data
    transactions = Transaction.includes(:master_store).where(client_id: params[:client_id]).order('datetime DESC')
    map = {}
    client_registration_month = @client.created_at.month
    client_registration_year = @client.created_at.year
    current_year = Time.now.year
    current_month = Time.now.month
    date = @client.created_at

    map['by_month_sum'] = []
	month_data = {}
    while current_year >= client_registration_year
		while current_month >= client_registration_month
			amount = transactions.by_month(client_registration_month, client_registration_year, field: :datetime).sum(:amount)
			month_data = {
				'amount': amount,
				'month': date.strftime("%B"),
				'month_index': client_registration_month
			}

			client_registration_month += 1
			date += 1.month
			client_registration_month = 1 if client_registration_month == 12
			map['by_month_sum'] << month_data
		end
		client_registration_year += 1
    end

    map['this_week'] = transactions.by_week(field: :datetime)
    map['this_month_spending'] = transactions.by_month(field: :datetime).sum(:amount)
    map['master_categories'] = Master::Category.all.select("id, name")
    render_result_json map
  end
end
