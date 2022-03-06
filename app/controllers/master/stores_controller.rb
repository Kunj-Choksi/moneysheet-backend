class Master::StoresController < ApplicationController
  layout 'dashboard'
  def index
    @stores = Master::Store.all
  end
end
