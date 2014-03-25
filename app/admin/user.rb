ActiveAdmin.register User do
  
  filter :email
  filter :first_name
  filter :last_name
  filter :telephone
  filter :address
  filter :created_at
  filter :updated_at


  index do
    column :email
    column :first_name
    column :last_name
    column :telephone
    column :address
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :telephone
      f.input :address
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  permit_params :email, :first_name, :last_name, :telephone, :address, :password, :password_confirmation      
  
end
