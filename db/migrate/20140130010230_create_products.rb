class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.text   :description
      t.float  :price, default: 1

      t.timestamps
    end
  end
end
