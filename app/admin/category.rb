ActiveAdmin.register Category do
  permit_params :name, :active

  index do
    selectable_column
    id_column
    column :name
    column :active
    actions
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :image
      f.input :active
    end
    f.actions
  end

end
