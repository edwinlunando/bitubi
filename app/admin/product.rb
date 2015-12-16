ActiveAdmin.register Product do

  actions :all, except: [:destroy]

  permit_params :name, :description, :price_dropship, :stock, :weight, :unit, :category_id, :user_id, :published,
                :recommended_price, :priority,
                wholesale_prices_attributes: [:id, :price, :minimum_quantity, :maximum_quantity, :_destroy],
                product_images_attributes: [:id, :data, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :slug
    column :published
    column :priority
    column :user do |product|
      link_to product.user, admin_user_path(product.user) if product.user.present?
    end
    actions
  end

  filter :name
  filter :id
  filter :category
  filter :user, member_method: :email
  filter :published

  show title: :name do |post|
    attributes_table do
      rows :name, :description, :price_dropship, :recommended_price, :stock, :weight, :unit, :category
      row :user do |product|
        link_to product.user, admin_user_path(product.user) if product.user.present?
      end
    end

    panel 'Images' do
      attributes_table_for post.product_images do
        row :data do |image|
          image_tag image.data.url(:medium)
        end
      end
    end

    panel 'Prices' do
      attributes_table_for post.wholesale_prices do
        row :price
        row :minimum_quantity
        row :maximum_quantity
      end
    end
  end

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :description
      f.input :stock
      f.input :unit
      f.input :weight, placeholder: 'dalam gram'
      f.input :user, member_label: :email, label: 'Supplier'
      f.input :price_dropship, placeholder: 'dalam IDR'
      f.input :recommended_price, placeholder: 'dalam IDR'
      f.input :category
      f.input :published
      f.input :priority
      f.has_many :wholesale_prices, heading: 'Wholesale Prices' do |a|
        a.input :id, as: :hidden
        a.input :price, placeholder: 'harga satuan dalam IDR'
        a.input :minimum_quantity
        a.input :maximum_quantity
        a.input :_destroy, as: :boolean
      end
      f.has_many :product_images, heading: 'Images' do |a|
        a.input :id, as: :hidden
        a.input :data, hint: image_tag(a.object.data.url(:medium))
        a.input :_destroy, as: :boolean
      end
    end
    f.actions
  end

end
