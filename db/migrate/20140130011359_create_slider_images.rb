class CreateSliderImages < ActiveRecord::Migration
  def change
    create_table :slider_images do |t|
      t.string :name
      t.string :image
      t.boolean :active

      t.timestamps
    end
  end
end
