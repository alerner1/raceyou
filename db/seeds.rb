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

photo_urls = 
  [
    "https://images.unsplash.com/photo-1589564928747-1fdf103d621b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=925&q=80",
    "https://images.unsplash.com/photo-1588625240662-a526e539fee4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1900&q=80",
    "https://images.unsplash.com/photo-1575865053526-8398eac68de7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1599698000828-2cf0562f2bf4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80",
    "https://images.unsplash.com/photo-1599638352687-763d660c197d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599584083055-3793a057b6de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=661&q=80",
    "https://images.unsplash.com/photo-1599683064250-4f96e6b1379b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1596438634274-8aef8665e22b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1599542936303-b40f61aefcd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599542830607-9b95911537bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80",
    "https://images.unsplash.com/photo-1599542935620-b8827cacaa8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599542935842-c5257971c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599434079299-552355e5ea65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599351960008-910c15ea735f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
    "https://images.unsplash.com/photo-1599362592925-fcbafea337a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=607&q=80",
    "https://images.unsplash.com/photo-1599465076185-1ae033fc5208?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80",
    "https://images.unsplash.com/photo-1593158849843-b2177aa9700e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=671&q=80",
    "https://images.unsplash.com/photo-1599522768240-6dc1b58d92a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599488981203-d107749d9feb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1599488303987-24a54f815908?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1592655044967-3347c7f94be3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1599556906120-b02499de8b84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1599474463289-30ce225dc363?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
    "https://images.unsplash.com/photo-1583724711595-ed09eedf1ff8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
    "https://images.unsplash.com/photo-1599285850707-36b115a218de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80",
    "https://images.unsplash.com/photo-1588206214433-44914c945f44?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1588208265940-80a7c7d1619d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1595702025016-74714664f56c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1591727884968-cc11135a19b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=655&q=80",
    "https://images.unsplash.com/photo-1556115986-652dc42dd60e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1598976702797-f3a7cb7bc3f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1599138480542-0729499c0f9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80",
    "https://images.unsplash.com/photo-1590235859018-a5d68e83e1f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80",
    "https://images.unsplash.com/photo-1594206630042-fb7e326675d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=80",
    "https://images.unsplash.com/photo-1599147208154-5c0d508d47a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1599149535927-36b3fc68a1d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599153511613-051d6e42ac70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1599070306640-28f961d4f89c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1599185706027-f1b66448a7a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=917&q=80",
    "https://images.unsplash.com/photo-1599106568584-899bebd32ffe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1586210476968-0bda053a4a31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1554060037-7778832b8904?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1585282779872-6ec1b149e551?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1598923926046-bcac7aec2ee3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1598895653854-d0d4b6e51ec9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1522508115664-391162d98bd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1587747412506-24faaf4f52c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1598886221109-b2b3d7699c16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=635&q=80",
    "https://images.unsplash.com/photo-1598496269180-447cb575e602?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1598676598606-d184bdb5c500?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  ]
photo_index = 0
50.times do 
  rank = Runner.categorize_on_signup(rand(11..40), 0)
  Runner.create(username: Faker::Superhero.unique.descriptor, 
                email: Faker::Internet.unique.email, 
                password_digest: Runner.digest(1234), 
                name: "#{Faker::Name.unique.first_name} #{Faker::Name.unique.last_name}", 
                age: rand(12..99),
                gender: ["M", "F", "Other"].sample,
                photo: photo_urls[photo_index],
                rank_category_id: rank,
                points: Runner.assign_initial_points(rank))
  photo_index += 1
end

# in_date_period = random date in current year
30.times do 
  unit_type = ["metric", "imperial"].sample
  if unit_type == "metric"
    length_units = "kilometers"
    elevation_units = "meters"
  else
    length_units = "miles"
    elevation_units = "feet"
  end
  Race.create(length: rand(1..26), length_units: length_units, elevation_increase: rand(1..500), elevation_increase_units: elevation_units, elevation_decrease:rand(1..500), elevation_decrease_units: elevation_units, expiration_date: Faker::Date.forward, created_by: Runner.all.sample.id)
end

60.times do
  Registration.create(runner: Runner.all.sample, race: Race.all.sample, completed: false, finish_time_mins: rand(10..30), finish_time_secs: rand(0..59))
end

100.times do 
  Friendship.create(runner: Runner.all.sample, friend: Runner.all.sample)
end