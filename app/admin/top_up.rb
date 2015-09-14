ActiveAdmin.register TopUp do

  permit_params :name, :amount, :user_id, :approved, :bank

  member_action :approve, method: :put do
    if resource.approve
      redirect_to resource_path, notice: "Approved!"
    else
      redirect_to collection_path, alert: "Failed to approved!"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :amount
    column :user
    column :bank
    column :approved
    actions do |top_up|
      link_to 'Approve', approve_admin_top_up_path(top_up), method: :put
    end
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :amount
      f.input :bank
      f.input :user, member_label: :email
    end
    f.actions
  end

end
