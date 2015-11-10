ActiveAdmin.register User do
  permit_params :email, :role, :phone_number

  index do
    selectable_column
    id_column
    column :email
    column :credit
    column :current_sign_in_at
    column :sign_in_count
    column :active
    column :role
    column :created_at
    actions do |user|
      item 'Aktivasi', activation_admin_user_path(user), method: :put
    end
  end

  member_action :activation, method: :put do
    resource.active = true
    resource.verified = true
    resource.save
    redirect_to collection_path, notice: 'Pengguna diaktivasi!'
  end

  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :phone_number
      f.input :role, collection: User.roles
      f.semantic_fields_for :supplier do |s|
        s.inputs 'Supplier' do
          s.input :name
          s.input :description
          s.input :address
          s.input :bank_account_number
          s.input :image
        end
      end
    end
    f.actions
  end
end
