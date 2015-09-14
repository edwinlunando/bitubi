ActiveAdmin.register TopUp do

  permit_params :name, :amount, :user_id, :approved

  index do
    selectable_column
    id_column
    column :name
    column :amount
    column :user
    column :approved
    actions
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :amount
      f.input :user
      f.input :approved
    end
    f.actions
  end

end
