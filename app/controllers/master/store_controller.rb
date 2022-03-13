class Master::StoreController < ApplicationController
  layout 'dashboard'
  before_action :check_for_logged_in_session

  def index
    @stores = Master::Store.all
  end
end
