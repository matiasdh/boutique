class AddOfferAndUnitAndHighlightToProduct < ActiveRecord::Migration
  def change
    add_column :products, :offer, :boolean
    add_column :products, :highlight, :boolean
    add_column :products, :unit, :integer, default: 0
  end
end
