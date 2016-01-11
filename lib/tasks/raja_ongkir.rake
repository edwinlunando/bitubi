namespace :raja_ongkir do

  desc 'Update Province from Raja Ongkir API'
  task province: :environment do
    file = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'province.json')
    raw_json_string = file.read
    json = JSON.parse(raw_json_string)
    provinces = json['rajaongkir']['results']
    province_ids = {}
    provinces.each do |province|
      province_ids[province['province'].upcase] = province['province_id'].to_i
    end
    Province.all.each do |province|
      if province_ids[province.name].nil?
        $stderr.puts province.inspect
        next
      end
      province.raja_ongkir_id = province_ids[province.name]
      province.save

      puts province.inspect
    end
  end

  desc 'Update City from Raja Ongkir API'
  task city: :environment do
    file = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'city.json')
    raw_json_string = file.read
    json = JSON.parse(raw_json_string)

    cities = json['rajaongkir']['results']
    city_ids = {}
    cities.each do |city|
      city_ids['KABUPATEN ' + city['city_name'].upcase] = city['city_id'].to_i
    end
    City.all.each do |city|
      if city_ids[city.name].nil?
        $stderr.puts city.inspect
        next
      end
      city.raja_ongkir_id = city_ids[city.name]
      city.save

      puts city.inspect
    end
  end

  desc 'Update State from Raja Ongkir API'
  task state: :environment do

  end

end
