class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params.has_key? 'search_term' and params[:search_term] and !params[:search_term].blank?
      @products = Product.where.not(thc_dose: nil,verified: false).fuzzy_search({product_name: params[:search_term],manufacturer: params[:search_term],flavor: params[:search_term],category: params[:search_term]},nil).page(params[:page]).per(params[:per_page])
    else
      @products = Product.where.not(thc_dose: nil,verified: false,file_name: nil,file_name: '').order("RANDOM()").page(params[:page]).per(params[:per_page])
    end
    render :json => { :data => @products, :page => params[:page], :per_page => params[:per_page]}
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      ApplicationMailer.product_added(@product).deliver
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name,:manufacturer,:type_strain,:thc,:file_name_2,:creator,:creatorId,:extract_type)
  end

end
