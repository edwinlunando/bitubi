ActiveAdmin.register City do

  actions :all, except: [:destroy]

  permit_params :name, :province_id, :raja_ongkir_id

  index do
    selectable_column
    id_column
    column :name
    column :province
    column :raja_ongkir_id
    actions
  end

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :province
      f.input :raja_ongkir_id
    end
    f.actions
  end

end
