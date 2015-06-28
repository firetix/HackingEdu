class NotesController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    logger.ap params
    if params.has_key? 'search_term' and params[:search_term] and !params[:search_term].blank?
      @products = Product.basic_search(params[:search_term]).page(params[:page]).per(params[:per_page])
    else
      @products = Product.page(params[:page]).per(params[:per_page])
    end
    logger.ap @products.length
    render json: @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update(params)
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
    params.require(:product).permit(:name)
  end

end
