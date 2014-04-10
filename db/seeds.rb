# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = User.create([
# {
#   email: Faker::Internet.email,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   password: 'password',
#   password_confirmation: 'password'
#  },
#  {
#   email: Faker::Internet.email,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   password: 'password',
#   password_confirmation: 'password'
#  },
#  {
#   email: Faker::Internet.email,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   password: 'password',
#   password_confirmation: 'password'
#  },
#  {
#   email: Faker::Internet.email,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   password: 'password',
#   password_confirmation: 'password'
#  },
#  {
#   email: Faker::Internet.email,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   password: 'password',
#   password_confirmation: 'password'
#  },
#    ])


gifts = Gift.create([
  {
  name: Faker::Product.product_name,
  price: 10,
},
  {
  name: Faker::Product.product_name,
  price: 20,
},   {
  name: Faker::Product.product_name,
  price: 30,
},
  {
  name: Faker::Product.product_name,
  price: 10,
},
  {
  name: Faker::Product.product_name,
  price: 20,
},   {
  name: Faker::Product.product_name,
  price: 30,
},
 ])

giftlists = Giftlist.create([
  {
  name: "Giftlist 1",
  note: "birthday present ideas",
  giftee: Faker::Name.first_name,
  user_id: 1
  },
  {
  name: "Giftlist 2",
  note: "housewarming present ideas",
  giftee: Faker::Name.first_name,
  user_id: 1
  },
    {
  name: "Giftlist 3",
  note: "graduation present ideas",
  giftee: Faker::Name.first_name,
  user_id: 2
  },
    {
  name: "Giftlist 4",
  note: "birthday present ideas",
  giftee: Faker::Name.first_name,
  user_id: 2
  },
])
