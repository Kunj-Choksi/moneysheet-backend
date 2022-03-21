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
    @categories = Master::Category.all
  end

  def create
    @master_store = Master::Store.new(master_store_params)
    if @master_store.save
      flash[:notice] = "Created Successfully!"
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Master::Category.all
  end

  def update
    if @master_store.update(master_store_params)
      flash[:notice] = "Updated Successfully!"
      redirect_to "/"
    else
      render 'edit'
    end
  end

  private

  def master_store_params
    params.require(:master_store).permit(:name, :logo_url, :category_id)
  end

  def set_master_store
    @master_store = Master::Store.find(params[:id])
  end
end
