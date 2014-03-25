class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true
      t.float :total_price
      t.string :address
      t.boolean :confirmed

      t.timestamps
    end
  end
end
