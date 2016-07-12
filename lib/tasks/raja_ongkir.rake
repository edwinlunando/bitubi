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

  desc 'Save sub district from Raja Ongkir API'
  task save_state: :environment do
    file = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'state.json'), 'w'
    state_result = []
    (1..501).to_a.each do |city_id|
      response = RestClient.get 'http://pro.rajaongkir.com/api/subdistrict?city=' + city_id.to_s, key: '7d0aa019d1f91e2aee53f69756b81786'
      json = JSON.parse(response.body)
      json['rajaongkir']['results'].each do |state|
        puts state.to_s
        state_result << state
      end
    end
    file.write(state_result.to_json)
  end

  desc 'Import state from Raja Ongkir Subdistrict'
  task import_state: :environment do
    file = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'state.json')
    raw_json_string = file.read
    json = JSON.parse(raw_json_string)
    # byebug
    json.each do |subdistrict|
      name = subdistrict['subdistrict_name']
      id = subdistrict['subdistrict_id']
      if State.where('name LIKE ?', '%' + name + '%').count > 0
        state = State.where('name LIKE ?', '%' + name + '%').first
        state.raja_ongkir_id = id
        puts state.inspect
        state.save
      end
    end
  end

  desc 'Export State JSON to low cost CSV'
  task export_state: :environment do
    file = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'state.json')
    raw_json_string = file.read
    json = JSON.parse(raw_json_string)
    output = File.open Rails.root.join('lib', 'assets', 'raja_ongkir', 'state.txt'), 'w'
    json.each do |subdistrict|
      output.puts [subdistrict['subdistrict_name'], subdistrict['city'], subdistrict['province'], subdistrict['subdistrict_id']].join(', ')
    end
    output.close
  end

  desc 'Update State from Raja Ongkir API'
  task state: :environment do

  end

end
