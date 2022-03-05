class Master::StoresController < ApplicationController
  before_action :check_for_user_session
  layout 'dashboard'
  
  def index
    @stores = Master::Store.all
  end

end
