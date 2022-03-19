class Master::StoresController < ApplicationController
  layout 'dashboard'
  before_action :check_for_logged_in_session
  before_action :set_master_store, only: [:show, :edit, :update]

  def index
    @master_stores = Master::Store.all
  end

  def show
  end

  def new
    @master_store = Master::Store.new
  end

  def create
    @master_store = Master::Store.new(set_master_store)
    if @master_store.save
      redirect_to @master_store
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @master_store.update(master_store_params)
      flash[:notice] = "Updated Successfully!"
      redirect_to @master_store
    else
      render 'edit'
    end
  end

  private

  def master_store_params
    params.require(:master_store).permit(:name, :logo_url)
  end

  def set_master_store
    @master_store = Master::Store.find(params[:id])
  end
end