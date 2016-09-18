ActiveAdmin.register Category do

  actions :all, except: [:destroy]

  permit_params :name, :active, :image

  index do
    selectable_column
    id_column
    column :name
    column :active
    actions
  end

  filter :active

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :image
      f.input :active
    end
    f.actions
  end

end
