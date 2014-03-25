ActiveAdmin.register Purchase do
   actions :all, :except => [:destroy, :edit, :new]

        filter :user
        filter :address
        filter :total_price
        filter :created_at
        filter :updated_at

  show do
    panel "Productos de la compra" do
      table_for purchase.cart_products.includes(:product) do |v|
        column "Cantidad", :quantity
        column "Producto", :product
        column "Precio", :price
        column "Precio total", :total_price
        column :created_at
        column :updated_at
      end
    end
  end

    sidebar "Detalle de la compra", only: [:show, :edit] do
      attributes_table_for purchase do
        row :user
        row :address
        row :teléfono do purchase.user.telephone end
        row :email do purchase.user.email end
        row :total_price
      end
    end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
