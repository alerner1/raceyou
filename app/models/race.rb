class Race < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :runners, through: :registrations
  
end