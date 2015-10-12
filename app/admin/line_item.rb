ActiveAdmin.register LineItem do

  permit_params :product_id, :quantity, :order, :purchase_type

  index do
    selectable_column
    id_column
    column :product
    column :quantity
    column :order
    column :purchase_type
    actions
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :product
      f.input :quantity
      f.input :order
      f.input :purchase_type
    end
    f.actions
  end

end
