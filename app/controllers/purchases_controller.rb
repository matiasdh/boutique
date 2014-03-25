class PurchasesController < ApplicationController
  before_action :authenticate_user!

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def new
    @purchase = current_user.purchases.new
    @purchase.cart_products = current_user.cart_products.includes(:product)
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = current_user.purchases.new(purchase_params)
    @purchase.cart_products = current_user.cart_products

    respond_to do |format|
      if @purchase.save
        MessageMailer.new_purchase_notifier(@purchase).deliver
        format.html { redirect_to @purchase, notice: 'Se ha realizado la compra con éxito.' }
        format.json { render action: 'show', status: :created, location: @purchase }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:address)
    end

end
