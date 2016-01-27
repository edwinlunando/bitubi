ActiveAdmin.register User do

  actions :all, except: [:destroy]

  permit_params :email, :role, :phone_number, :active, :verified,
                supplier_attributes: [:id, :name, :description, :address, :bank_account_name,
                                      :bank_account_number, :bank_name, :image, :banner_image, :city_id]

  index do
    selectable_column
    id_column
    column :email
    column :credit
    column :current_sign_in_at
    column :sign_in_count
    column :active
    column :role
    column :verified
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
    object.supplier = Supplier.new if object.supplier.blank?
    f.inputs 'Admin Details' do
      f.input :email
      f.input :phone_number
      f.input :password
      f.input :verified
      f.input :active
      f.input :role, collection: User.roles
      f.semantic_fields_for :supplier do |s|
        s.inputs 'Supplier' do
          s.input :id, as: :hidden
          s.input :name
          s.input :description
          s.input :address
          s.input :bank_account_name
          s.input :bank_account_number
          s.input :bank_name, collection: Supplier.bank_list
          s.input :image, hint: image_tag(s.object.image.url(:medium))
          s.input :banner_image, hint: image_tag(s.object.banner_image.url(:medium))
          s.input :city, collection: City.order('name')
          # s.input :city_id, collection: City.order('name')
        end
      end
    end
    f.actions
  end

  controller do

    def new
      super do
        @user.supplier ||= Supplier.new
      end
    end

    def edit
      super do
        @user.supplier ||= Supplier.new
      end
    end

    def update
      params[:user].delete('password') if params[:user][:password].blank?
      super
    end
  end

end
