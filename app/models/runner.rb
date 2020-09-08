class Runner < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :registrations, dependent: :destroy
  has_many :races, through: :registrations
  has_many :stats
  belongs_to :rank_category
end