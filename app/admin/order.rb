ActiveAdmin.register Order do

  permit_params :total, :special_instruction, :state

  index do
    selectable_column
    id_column
    column :total
    column :special_instruction
    column :state
    actions do |order|
      if order.confirm?
        item 'Konfirmasi', confirmed_admin_order_path(order), method: :put, 'data-confirm': 'Yakin?'
      end
      if order.delivery?
        item 'Kirim', delivered_admin_order_path(order), method: :put, 'data-confirm': 'Yakin?'
      end
    end
  end

  member_action :confirmed, method: :put do
    if resource.confirm?
      resource.confirming
      resource.save
      redirect_to collection_path, notice: "Order Dikonfirmasi!"
    end
  end

  member_action :delivered, method: :put do
    if resource.delivery?
      resource.finish
      resource.save
      redirect_to collection_path, notice: "Order Dikirim!"
    end
  end

  show :title => :id do |post|

    attributes_table do
      rows :special_instruction, :state, :user
      row :total do |order|
        ActionController::Base.helpers.number_to_currency(order.get_total, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
    end

    panel 'Products' do
      attributes_table_for post.line_items do
        row :product do |line_item|
          line_item.product.name
        end
        row :quantity
        row :purchase_type
      end
    end

  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :total
      f.input :special_instruction
      f.input :state, collection: Order.states
      f.input :user, member_label: :email
      f.has_many :line_items, heading: 'Products' do |a|
        a.input :product
        a.input :quantity
      end
    end
    f.actions
  end


end
