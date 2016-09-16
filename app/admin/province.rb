ActiveAdmin.register Province do

  actions :all, except: [:destroy]

  permit_params :name, :raja_ongkir_id

  index do
    selectable_column
    id_column
    column :name
    column :raja_ongkir_id
    actions
  end

  filter :name
  filter :raja_ongkir_id

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :raja_ongkir_id
    end
    f.actions
  end

end
