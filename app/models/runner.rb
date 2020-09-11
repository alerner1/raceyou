class Runner < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :registrations, dependent: :destroy
  has_many :races, through: :registrations
  belongs_to :rank_category

  has_secure_password

  #Validations
  validates :name, :email, :age, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :age, numericality: {greater_than_or_equal_to: 12}
  

# so we can seed with a password
  # source: https://stackoverflow.com/questions/31026248/encrypt-users-password-in-seed-file
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def points=(points) # custom writer so they can't be < 0 at any time
    if points && points < 0
      points = 0
    end
    write_attribute(:points, points)
  end

  def self.categorize_on_signup(mins, secs)
    
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
  
  def self.assign_initial_points(category_id)
    category = RankCategory.find(category_id)

    case category.name
    when "bronze"
      100
    when "silver"
      200
    when "gold"
      300
    when "platinum"
      400
    when "diamond"
      500
    when "master"
      600
    when "grandmaster"
      700
    end
  end

  def categorize_by_points
    case self.points
    when 0..200
      category = "bronze"
    when 201..300
      category = "silver"
    when 301..400
      category = "gold"
    when 401..500
      category = "platinum"
    when 501..600
      category = "diamond"
    when 601..700
      category = "master"
    else # greater than 700 
      category = "grandmaster"
    end
  end

  def adjust_ranking(race)
    # get their place
    registration = self.registrations.find_by(race_id: race.id)
    place = registration.place
    category = self.rank_category
    points = self.points

    race.runners.each do |runner|
      other_registration = runner.registrations.find_by(race_id: race.id)
      other_place = other_registration.place
      other_category = runner.rank_category
      other_points = runner.points
      point_differential = 0

      # their place is a greater number than mine, aka i beat them
      if other_place > place 
        point_differential = 12

        # if they have a higher rank overall
        if other_points > points
          
          point_differential += (other_points - points).to_f / 10
          point_differential = point_differential.to_i # truncated but i really don't care
        end

        # i won but they're in a lower category
        if other_category.id < category.id # more advanced categories always get assigned later, therefore they always have a higher id number
          category_difference = category.id - other_category.id
          # remove two points per category they are below me
          point_differential -= category_difference * 2
        end

      # their place is a lower number than mine, aka they beat me
      elsif other_place < place
        point_differential = -12

        # i lost but they're in a higher category
        if other_category.id > category.id
          category_difference = other_category.id - category.id
          
          # subtract from a negative number = add
          point_differential -= category_difference * 2
        end
      end
      # use point_differential to get new points total
      self.update(points: self.points + point_differential)
      
      # then call method that assigns a category based on points total
      self.categorize_by_points
    end  
    
  end

  
  def self.sort_by_name #yes, first name, whatever
    Runner.all.sort_by{ |r| r.name.capitalize }
  end

  def self.sort_by_points(runners)
    runners.sort_by{ |r| r.points }
  end
end
