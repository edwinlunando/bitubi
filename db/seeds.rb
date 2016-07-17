# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Elektronik')
Category.create(name: 'Makanan ringan')
Category.create(name: 'Makanan berat')

ShipmentType.create(name: 'jne_reguler', display_name: 'JNE Reguler')
ShipmentType.create(name: 'jne_oke', display_name: 'JNE Oke')
ShipmentType.create(name: 'jne_yes', display_name: 'JNE Yes')
