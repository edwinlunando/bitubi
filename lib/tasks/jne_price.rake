namespace :jne do
  desc 'Update JNE Price from xls'
  task update_from_xls: :environment do
    StateShipmentPrice.destroy_all
    require 'spreadsheet'
    book = Spreadsheet.open Rails.root.join('lib', 'assets', 'price_jne_juni_2015.xls')
    worksheet = book.worksheet 0
    # informasi kolom
    # 3 state 5 reguler 7 oke 9 yes

    jne_reguler = ShipmentType.find(1)
    jne_oke = ShipmentType.find(2)
    jne_yes = ShipmentType.find(3)

    worksheet.each_with_index do |row, index|
      next if index < 3
      next if State.where('lower(name) = ?', row[3].downcase).count == 0
      state = State.where('lower(name) = ?', row[3].downcase).first

      # jne reguler
      if row[5] != '-'
        price = StateShipmentPrice.new
        price.state = state
        price.shipment_type = jne_reguler
        price.price = row[5].to_i
        price.save
      end

      puts price.inspect

      # jne oke
      if row[7] != '-'
        price = StateShipmentPrice.new
        price.state = state
        price.shipment_type = jne_oke
        price.price = row[7].to_i
        price.save
      end

      puts price.inspect

      # jne yes
      if row[9] != '-'
        price = StateShipmentPrice.new
        price.state = state
        price.shipment_type = jne_yes
        price.price = row[9].to_i
        price.save
      end

      puts price.inspect
    end
  end
end
