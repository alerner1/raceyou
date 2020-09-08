# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Registration.destroy_all
Friendship.destroy_all
Stat.destroy_all
RankCategory.destroy_all
Race.destroy_all
Runner.destroy_all

5.times do 
  Runner.create(name: Faker::Name, )
end