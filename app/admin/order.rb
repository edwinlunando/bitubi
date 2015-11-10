ActiveAdmin.register Order do

  permit_params :total, :special_instruction, :state

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
    actions
  end

  filter :id

  show title: :id do |post|

    attributes_table do
      rows :special_instruction, :state, :user
      row :total_without_shipment do |order|
        ActionController::Base.helpers.number_to_currency(order.total_without_shipment, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
      row :shipment_price do |order|
        ActionController::Base.helpers.number_to_currency(order.shipment_price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
      end
      row :total do |order|
        ActionController::Base.helpers.number_to_currency(order.total, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
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
