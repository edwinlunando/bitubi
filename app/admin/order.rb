ActiveAdmin.register Order do

  controller do
    def scoped_collection
      super.admin
    end
  end

  permit_params :total, :special_instruction, :state

  member_action :transfer, method: :put do
    resource.transfer
    redirect_to collection_path, notice: 'Berhasil transfer'
  end

  index do
    selectable_column
    id_column
    column :total_without_shipment do |order|
      ActionController::Base.helpers.number_to_currency(order.total_without_shipment, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
    end
    column :shipment_price do |order|
      ActionController::Base.helpers.number_to_currency(order.shipment_price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
    end
    column :total do |order|
      ActionController::Base.helpers.number_to_currency(order.total, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
    end
    column :state
    column :user do |order|
      if order.user.present?
        link_to order.user, admin_user_path(order.user)
      end
    end
    column :supplier do |order|
      if order.suppliers.present?
        supplier = order.suppliers.first
        link_to supplier, admin_user_path(supplier)
      end
    end
    column :created_at
    actions do |order|
      if !order.transferred && order.done?
        link_to 'Transfer', transfer_admin_order_path(order), method: :put
      end
    end
  end

  filter :id
  filter :user, member_method: :email

  show title: :id do |post|

    attributes_table do
      rows :state
      row :user do |order|
        link_to order.user, admin_user_path(order.user)
      end
      row :total_without_shipment do |order|
        ActionController::Base.helpers.number_to_currency(order.total_without_shipment, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
      row :shipment_price do |order|
        ActionController::Base.helpers.number_to_currency(order.shipment_price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
      row :total do |order|
        ActionController::Base.helpers.number_to_currency(order.total, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
      row :receipt_number
      row :transferred
      row :transfer_time
      row :supplier do |order|
        if order.suppliers.present?
          supplier = order.suppliers.first
          link_to supplier, admin_user_path(supplier)
        end
      end
      row :created_at
    end

    panel 'Address' do
      attributes_table_for resource.address do
        row :name
        row :state
        row :city do |address|
          address.try(:state).try(:city)
        end
        row :province do |address|
          address.try(:state).try(:city).try(:province)
        end
        row :receiver_name
        row :receiver_phone
        row :sender_name
        row :sender_phone
        row :special_instructions
      end
    end

    panel 'Products' do
      attributes_table_for post.line_items do
        row :product do |line_item|
          line_item.product.name
        end
        row :quantity
      end
    end

  end

  filter :active

  form do |f|
    f.inputs 'Admin Details' do
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
