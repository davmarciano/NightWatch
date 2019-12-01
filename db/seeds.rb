# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting DB"
User.delete_all
Watchlist.delete_all
puts "Done !"

# puts "Create user"
# user = User.create!(first_name: 'David', last_name: 'Marciano', email: 'david@gmail.com', password: '123456')
# user2 = User.create!(first_name: 'Steve', last_name: 'Jobs', email: 'steve@gmail.com', password: '123456')
# puts "Create playlist"
# watchlist = Watchlist.create!(name: 'My Watchlist', user_id: user.id)
# puts "Done !!!"
