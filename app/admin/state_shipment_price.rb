ActiveAdmin.register StateShipmentPrice do

  actions :all, except: [:destroy]

  permit_params :state_id, :price, :shipment_type_id

  index do
    selectable_column
    id_column
    column :state
    column :shipment_type
    column :price
    actions
  end

  filter :state_name, as: :string
  filter :shipment_type
  filter :price

  form do |f|
    f.inputs 'Admin Details' do
      f.input :state
      f.input :shipment_type
      f.input :price
    end
    f.actions
  end

end
