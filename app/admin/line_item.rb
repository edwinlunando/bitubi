ActiveAdmin.register LineItem do

  permit_params :product_id, :quantity, :order, :purchase_type

  index do
    selectable_column
    id_column
    column :product
    column :quantity
    column :receipt_number
    column :order
    actions
  end

  filter :order, member_label: :id
  filter :reciept_number

  form do |f|
    f.inputs 'Admin Details' do
      f.input :product
      f.input :quantity
      f.input :receipt_number
      f.input :order, member_label: :id
    end
    f.actions
  end

end
