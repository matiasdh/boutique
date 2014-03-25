ActiveAdmin.register Product do
  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

    filter :name
    filter :price
    filter :description
    filter :created_at
    filter :updated_at

  index do
    sortable_handle_column # inserts a drag handle
    column :id
    column :image
    column :name
    column :price
    column :unit
    column :description
    column :offer
    column :highlight
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :offer
      f.input :highlight
      f.input :image
      f.input :description
      f.input :price
      f.input :unit, collection: Product::UNITS, :as => :radio
    end
    f.actions
  end
  
   permit_params :image, :name, :description, :price, :unit, :offer, :highlight
  
end
