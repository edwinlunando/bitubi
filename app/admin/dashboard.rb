ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel 'Recent Orders' do
          table_for Order.last(5) do
            column :id
            column :user
            column :total_without_shipment do |order|
              ActionController::Base.helpers.number_to_currency(order.total_without_shipment, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
            end
            column :shipment_price do |order|
              ActionController::Base.helpers.number_to_currency(order.shipment_price, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
            end
            column :total do |order|
              ActionController::Base.helpers.number_to_currency(order.total, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
            end
          end
        end
      end
    end
  end # content
end
