namespace :line_item do

  desc 'Update fixed price from product'
  task update_fixed_price: :environment do
    LineItem.where(fixed_price: nil).each do |line_item|
      line_item.fixed_price = line_item.price_per_quantity
      line_item.save
    end
  end
end
