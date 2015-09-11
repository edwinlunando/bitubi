ActiveAdmin.register Product do

  permit_params :name, :description, :price_dropship, :price_wholesale, :stock

  index do
    selectable_column
    id_column
    column :name
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
      f.has_many :wholesale_prices, heading: 'Wholesale Prices' do |a|
        a.input :price, placeholder: 'dalam IDR'
        a.input :minimum_quantity
      end
      f.has_many :product_images, heading: 'Images' do |a|
        a.input :data
      end
    end
    f.actions
  end

end
