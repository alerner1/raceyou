# Faker gem guide: https://github.com/faker-ruby/faker

Registration.destroy_all
Friendship.destroy_all
Stat.destroy_all
Race.destroy_all
Runner.destroy_all

# seed these, don't destroy them because they're the same every time
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
                rank: rand(1..10)
              )
end