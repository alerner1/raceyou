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
end