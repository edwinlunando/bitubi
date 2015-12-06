ActiveAdmin.register City do

  actions :all, except: [:destroy]

  permit_params :name, :province_id

  index do
    selectable_column
    id_column
    column :name
    column :province
    actions
  end

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :province
    end
    f.actions
  end

end
