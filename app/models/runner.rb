class Runner < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :registrations, dependent: :destroy
  has_many :races, through: :registrations
  belongs_to :rank_category

  has_secure_password

  # so we can seed with a password
  # source: https://stackoverflow.com/questions/31026248/encrypt-users-password-in-seed-file
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.categorize(mins, secs)
    
    case mins.to_i
    when 35..100
      category = "bronze"
    when 30..35
      category = "silver"
    when 27..29
      category = "gold"
    when 24..26
      category = "platinum"
    when 21..23
      category = "diamond"
    when 18..20
      category = "master"
    when 11..17
      category = "grandmaster"
    end
    
    RankCategory.find_by(name: category).id
  end
end