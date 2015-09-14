ActiveAdmin.register Product do

  permit_params :name, :description, :price_dropship, :stock, :weight, :unit, :category_id, :user_id,
                wholesale_prices_attributes: [:price, :minimum_quantity],
                product_images_attributes: [:data]

  index do
    selectable_column
    id_column
    column :name
    column :slug
    actions
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :description
      f.input :stock
      f.input :unit
      f.input :weight, placeholder: 'dalam gram'
      f.input :user, member_label: :email, label: 'Supplier'
      f.input :price_dropship, placeholder: 'dalam IDR'
      f.input :category
      f.has_many :wholesale_prices, heading: 'Wholesale Prices' do |a|
        a.input :price, placeholder: 'harga satuan dalam IDR'
        a.input :minimum_quantity
      end
      f.has_many :product_images, heading: 'Images' do |a|
        a.input :data, :hint => image_tag(a.object.data.url(:medium))
        a.input :_destroy, as: :boolean
      end
    end
    f.actions
  end

end
