# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password') unless AdminUser.exists?(email: 'admin@example.com')
products = [
  {
    name:"asado 3 cost",
    price:90
  },
  {
    name:"asado 13 cost (premium)",
    price:125
  },
  {
    name:"asado 10 cost (premium de exportacion)",
    price:169
  },
  {
    name:"pulpon",
    price:169
  },
  {
    name:"bife de vacio",
    price:208
  },
  {
    name:"bife de chorizo (entrecot parrillero )",
    price:235
  },
  {
    name:"baby beef (bife ancho)",
    price:280
  },
  {
    name:"costillas de cerdo",
    price:159
  },
  {
    name:"bondiola",
    price:135
  },
  {
    name:"colita de cuadril",
    price:234
  },
  {
    name:"matambre",
    price:125
  },
  {
    name:"peceto",
    price:199
  },
  {
    name:"picaña",
    price:320
  },
  {
    name:"milanesas tiernizadas",
    price:185
  },
  {
    name:"chinchulines",
    price:80
  },
  {
    name:"mollejas",
    price:234
  },
  {
    name:"riñon",
    price:62
  },
  {
    name:"matambrito de cerdo",
    price:260
  },
  {
    name:"lomo",
    price:370
  },
  {
    name:"cuadril",
    price:221
  },
  {
    name:"costilla redonda",
    price:169
  },
  {
    name:"costilla con lomo",
    price:199
  },
  {
    name:"costilla sin lomo",
    price:181
  },
  {
    name:"higado",
    price:70
  },
  {
    name:"pollo",
    price:65
  },
  {
    name:"supremas",
    price:165
  },
  {
    name:"muslos",
    price:70
  },
  {
    name:"alitas",
    price:30
  },
  {
    name:"chirizo de pollo casero",
    price:129
  },
  {
    name:"chorizo de cerdo relleno morron y queso",
    price:155
  },
  {
    name:"chorizo cattivelli",
    price:206
  },
  {
    name:"morcilla kali salada rellena de queso",
    price:147
  },
  {
    name:"morcilla kali dulce con almendras y pasas",
    price:147
  },
  {
    name:"brochet carne",
    price:30
  }
]

products.each do |v|
	v[:name] = v[:name].titleize
	Product.create!(v)
end