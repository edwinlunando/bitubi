ActiveAdmin.register Product do

  actions :all, except: [:destroy]

  permit_params :name, :description, :price_dropship, :stock, :weight, :slug, :unit, :category_id, :user_id, :published,
                :recommended_price, :priority,
                wholesale_prices_attributes: [:id, :price, :minimum_quantity, :maximum_quantity, :_destroy],
                product_images_attributes: [:id, :data, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column 'Kode barang', :slug
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
      f.input :description, :input_html => { :class => "tinymce" }
      f.input :slug, label: 'Kode barang'
      f.input :stock
      f.input :unit
      f.input :weight, placeholder: 'dalam gram'
      f.input :user, member_label: :email, label: 'Supplier'
      f.input :price_dropship, placeholder: 'dalam IDR'
      f.input :recommended_price, placeholder: 'dalam IDR'
      f.input :category
      f.input :published
      f.input :priority
      f.input :bbm
      f.input :sms
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

  csv do
    column('No') { |product| product.id }
    column('Source page') { |product| product_url(product) }
    column('Nama produk') { |product| product.name }
    column('Harga grosir 1') { |product| product.wholesale_prices.try(:first).try(:price) }
    column('Harga grosir 2') { |product| product.wholesale_prices.try(:second).try(:price) }
    column('Harga grosir 3') { |product| product.wholesale_prices.try(:third).try(:price) }
    column('Harga grosir 4') { |product| product.wholesale_prices.try(:fourth).try(:price) }
    column('Min order 1') { |product| product.wholesale_prices.try(:first).try(:minimum_quantity) }
    column('Min order 2') { |product| product.wholesale_prices.try(:second).try(:minimum_quantity) }
    column('Min order 3') { |product| product.wholesale_prices.try(:third).try(:minimum_quantity) }
    column('Min order 4') { |product| product.wholesale_prices.try(:fourth).try(:minimum_quantity) }
    column('Harga pasar') { |product| product.recommended_price }
    column('Deskripsi') { |product| product.description }
    column('Berat') { |product| product.weight }
    column('Stok') { |product| product.stock }
    column('Penjual') { |product| product.supplier.try(:name) }
    column('Link penjual') { |product| vendor_view_url(product.user) }
    column('Lokasi') { |product| product.user.try(:supplier).try(:city).try(:name) }
    column('Gambar 1') { |product| asset_url(product.product_images.try(:first).try(:data).try(:url)) }
    column('Gambar 2') { |product| asset_url(product.product_images.try(:second).try(:data).try(:url)) }
    column('Gambar 3') { |product| asset_url(product.product_images.try(:third).try(:data).try(:url)) }
  end

end
