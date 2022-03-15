class Master::CategoriesController < ApplicationController
  before_action :set_master_category, only: %i[ show edit update destroy ]
  layout 'dashboard'
  before_action :check_for_logged_in_session

  # GET /master/categories or /master/categories.json
  def index
    @master_categories = Master::Category.all
  end

  # GET /master/categories/1 or /master/categories/1.json
  def show
  end

  # GET /master/categories/new
  def new
    @master_category = Master::Category.new
  end

  # GET /master/categories/1/edit
  def edit
  end

  # POST /master/categories or /master/categories.json
  def create
    @master_category = Master::Category.new(master_category_params)

    respond_to do |format|
      if @master_category.save
        format.html { redirect_to master_category_path(@master_category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @master_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master/categories/1 or /master/categories/1.json
  def update
    respond_to do |format|
      if @master_category.update(master_category_params)
        format.html { redirect_to master_category_path(@master_category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master/categories/1 or /master/categories/1.json
  def destroy
    @master_category.destroy

    respond_to do |format|
      format.html { redirect_to master_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_master_category
    @master_category = Master::Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def master_category_params
    params.require(:master_category).permit(:name, :status_id)
  end
end
