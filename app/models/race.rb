class Race < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :runners, through: :registrations
  
  #Validations

  validates :length, :expiration_date, :created_by, presence: true
  validates :length, numericality: {greater_than: 0}

  def end_of_race
    
    # for all runners in that race (@race.runners)
    assign_places

    self.runners.each do |runner|
      runner.adjust_ranking(self)
    end
  end

  def assign_places
    sorted_registrations = self.registrations.sort_by{ |r| [r.finish_time_mins, r.finish_time_secs]}
    self.registrations.each do |r|
      r.update(place: sorted_registrations.index(r) + 1)
    end
    
  end
end