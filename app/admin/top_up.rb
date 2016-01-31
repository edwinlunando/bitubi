ActiveAdmin.register TopUp do

  actions :all, except: [:destroy]

  permit_params :name, :amount, :user_id, :approved, :bank

  member_action :approve, method: :put do
    if resource.approve
      redirect_to resource_path, notice: 'Approved!'
    else
      redirect_to collection_path, alert: 'Failed to approve!'
    end
  end

  member_action :decline, method: :put do
    if resource.decline
      redirect_to resource_path, notice: 'Declined!'
    else
      redirect_to collection_path, alert: 'Failed to decline!'
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :amount
    column :uid
    column :user do |top_up|
      link_to top_up.user.try(:email), admin_user_path(top_up.user)
    end
    column :bank
    column :transfer
    column :approved
    actions do |top_up|
      if top_up.approved.nil?
        item 'Approve', approve_admin_top_up_path(top_up), method: :put, 'data-confirm' => 'Apakah Anda yakin?'
        item 'Decline', decline_admin_top_up_path(top_up), method: :put, 'data-confirm' => 'Apakah Anda yakin?'
      end
    end
  end

  filter :user, member_method: :email
  filter :created_at
  filter :active

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :amount
      f.input :bank
      f.input :user, member_label: :email
    end
    f.actions
  end
end
