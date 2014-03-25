class CartProductsController < ApplicationController
  before_action :set_cart_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  layout 'modal'

  # GET /users
  # GET /users.json
  def index
    @cart_products = current_user.cart_products
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @cart_product = current_user.cart_products.find_or_initialize_by(product_id:cart_params[:product_id])
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @cart_product = current_user.cart_products.find_or_initialize_by(product_id:cart_params[:product_id])

    respond_to do |format|
      if @cart_product.update(cart_params)
        format.html { redirect_to @cart_product, notice: 'Cart product was successfully added.' }
        format.json { render action: 'show', status: :created, location: @cart_product }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
        format.js { render 'reload' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @cart_product.update(cart_params)
        format.html { redirect_to @cart_product, notice: 'Cart product was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
        format.js { render 'reload' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @cart_product.destroy
    respond_to do |format|
      format.html { redirect_to cart_products_url }
      format.json { head :no_content }
      format.js
    end
  end

  def purchase
    @purchase = current_user.purchase_products
    respond_to do |format|
      format.html { redirect_to @purchase, notice: 'Cart product was successfully updated.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_cart_product
      @cart_product = current_user.cart_products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart_product).permit(:quantity, :product_id)
    end
end
