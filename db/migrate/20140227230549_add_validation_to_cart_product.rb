class AddValidationToCartProduct < ActiveRecord::Migration
  def change
  	add_index :cart_products, [:product_id, :owner_id, :owner_type], unique: true
  end
end
