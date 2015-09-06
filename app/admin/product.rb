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
      f.input :price_dropship
      f.input :price_wholesale
      f.input :stock
      f.input :user
      f.has_many :product_images, heading: 'Images' do |a|
        a.input :data
      end
    end
    f.actions
  end

end
