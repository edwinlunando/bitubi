ActiveAdmin.register Order do

  actions :all, except: [:destroy]

  controller do
    def scoped_collection
      super.admin
    end
  end

  permit_params :total, :special_instruction, :state, :receipt_number

  member_action :paid, method: :put do
    resource.confirm
    redirect_to collection_path, notice: 'Berhasil Konfirmasi Transfer'
  end

  member_action :transfer, method: :put do
    resource.transfer
    redirect_to collection_path, notice: 'Berhasil transfer'
  end

  member_action :cancel, method: :put do
    resource.cancel_order
    redirect_to collection_path, notice: 'Pesanan dibatalkan'
  end

  batch_action :transfer do |ids|
    Order.find(ids).each do |order|
      order.transfer
    end
    redirect_to collection_path, alert: 'Order berhasil ditransfer!'
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
    column :bank_transfer
    column :bank_amount
    column :created_at
    column :payment_time
    actions do |order|
      if order.payment?
        item 'Paid ', paid_admin_order_path(order), method: :put, 'data-confirm' => 'Apakah Anda yakin konfirmasi?'
      end
      if !order.transferred && order.done?
        item 'Transfer ', transfer_admin_order_path(order), method: :put, 'data-confirm' => 'Apakah Anda yakin?'
      end
      if order.delivery? || order.payment?
        item 'Cancel', cancel_admin_order_path(order), method: :put, 'data-confirm' => 'Apakah Anda yakin melakukan pembatalan?'
      end
    end
  end

  filter :id
  filter :user_email, as: :string, label: 'User'
  filter :products_user_email, as: :string, label: 'Vendor'
  filter :payment_time
  filter :state, as: :select, collection: Order.states

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
      row :total_weight_gram
      row :shipment_price_name
      row :receipt_number
      row :transferred
      row :transfer_time
      row :supplier do |order|
        if order.suppliers.present?
          supplier = order.suppliers.first
          link_to supplier, admin_user_path(supplier)
        end
      end
      row :bank_transfer
      row :bank_amount
      row :created_at
      row :payment_time
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
      f.input :receipt_number, label: 'Resi'
      f.has_many :line_items, heading: 'Products' do |a|
        a.input :product
        a.input :quantity
      end
    end
    f.actions
  end

  controller do
    def apply_filtering(chain)
      @search = chain.ransack clean_search_params params[:q]
      @search.result(distinct: true)
    end
  end

end