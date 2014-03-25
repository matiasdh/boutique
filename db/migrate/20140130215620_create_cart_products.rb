class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.references :owner, polymorphic: true, index: true
      t.references :product, index: true
      t.float :price
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
