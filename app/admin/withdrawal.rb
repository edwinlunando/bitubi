ActiveAdmin.register Withdrawal do

  actions :all, except: [:destroy, :edit]

  permit_params :name, :amount, :user_id, :approved, :bank

  member_action :approve, method: :put do
    if resource.approve
      redirect_to resource_path, notice: 'Approved!'
    else
      redirect_to collection_path, alert: 'Failed to approved!'
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
    column :amount
    column :user do |withdrawal|
      link_to withdrawal.user.try(:email), admin_user_path(withdrawal.user)
    end
    column :approved
    column :created_at
    actions do |withdrawal|
      if withdrawal.approved.nil?
        item 'Approve ', approve_admin_withdrawal_path(withdrawal), method: :put, 'data-confirm' => 'Apakah Anda yakin?'
        item 'Decline', decline_admin_withdrawal_path(withdrawal), method: :put, 'data-confirm' => 'Apakah Anda yakin?'
      end
    end
  end

  filter :user, member_method: :email
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :amount
      f.input :user, member_label: :email
    end
    f.actions
  end
end
