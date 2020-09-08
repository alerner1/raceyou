# Faker gem guide: https://github.com/faker-ruby/faker

Registration.destroy_all
Friendship.destroy_all
Race.destroy_all
Runner.destroy_all
RankCategory.destroy_all

RankCategory.create(name: "bronze")
RankCategory.create(name: "silver")
RankCategory.create(name: "gold")
RankCategory.create(name: "platinum")
RankCategory.create(name: "diamond")
RankCategory.create(name: "master")
RankCategory.create(name: "grandmaster")

5.times do 
  Runner.create(username: Faker::Superhero.descriptor, 
                email: Faker::Internet.email, 
                password_digest: Runner.digest(Faker::Lorem.word), 
                name: Faker::Name.name, 
                age: rand(1..99),
                gender: Faker::Gender.type,
                rank_category: RankCategory.all.sample,
                rank: rand(1..10))
end

# in_date_period = random date in current year
3.times do 
  Race.create(race_type: ["distance", "speed"].sample, length: "#{rand(1..26)} miles", elevation_increase: rand(1..500), elevation_decrease:rand(1..500), expiration_date: Faker::Date.in_date_period)
end

6.times do
  Registration.create(runner: Runner.all.sample, race: Race.all.sample, completed: false)
end

10.times do 
  Friendship.create(runner: Runner.all.sample, friend: Runner.all.sample)
end