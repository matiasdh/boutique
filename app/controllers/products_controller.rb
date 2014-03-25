class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("position ASC")
  end

end
