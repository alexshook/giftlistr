10.times do
  Recipient.create(name: Faker::Name.first_name, birthday: Date.today, user_id: User.all.sample.id)
end

10.times do |i|
  Giftlist.create(name: Faker::Company.name + i.to_s, recipient_id: Recipient.all.sample.id, user_id: User.all.sample.id)
end

10.times do
  Gift.create(name: Faker::Company.name + " gift", price: 100)
end


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


# gifts = Gift.create([
#   {
#   name: Faker::Product.product_name,
#   price: 10,
# },
#   {
#   name: Faker::Product.product_name,
#   price: 20,
# },   {
#   name: Faker::Product.product_name,
#   price: 30,
# },
#   {
#   name: Faker::Product.product_name,
#   price: 10,
# },
#   {
#   name: Faker::Product.product_name,
#   price: 20,
# },   {
#   name: Faker::Product.product_name,
#   price: 30,
# },
#  ])

# giftlists = Giftlist.create([
#   {
#   name: "Giftlist 1",
#   note: "birthday present ideas",
#   giftee: Faker::Name.first_name,
#   user_id: 1
#   },
#   {
#   name: "Giftlist 2",
#   note: "housewarming present ideas",
#   giftee: Faker::Name.first_name,
#   user_id: 1
#   },
#     {
#   name: "Giftlist 3",
#   note: "graduation present ideas",
#   giftee: Faker::Name.first_name,
#   user_id: 2
#   },
#     {
#   name: "Giftlist 4",
#   note: "birthday present ideas",
#   giftee: Faker::Name.first_name,
#   user_id: 2
#   },
# ])
