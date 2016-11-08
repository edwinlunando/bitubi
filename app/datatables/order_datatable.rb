class OrderDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= [orders.id, orders.state, orders.user.email]
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= [orders.id, orders.state, orders.user.email]
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.state,
        record.user.email
      ]
    end
  end

  def get_raw_records
    # insert query here
    Order.vendor.joins(line_items: [:product])
                .includes(:line_items, :user, :state_shipment_price)
                .where('products.user_id = ?', current_user.id)
                .where(state: [:delivery, :done, :failed])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
