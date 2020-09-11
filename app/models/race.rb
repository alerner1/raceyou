class Race < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :runners, through: :registrations
  
  #Validations

  validates :length, :expiration_date, :created_by, presence: true
  validates :length, numericality: {greater_than: 0}

  def end_of_race
    # when a race ends -- ie its expiration date passes -- the program should go through each runner, look at their results, and adjust their ranking accordingly
    # of course, that's somewhat difficult, as that probably needs to be done on startup?
    # so maybe instead when you display a runner's category (at any point in any way) it checks if another race has expired and adjusts accordingly
    # idk, we'll get to that later. in the meantime, assume all that has happened and now we know who the runner beat and who they were beaten by, and what those people's rankings are
    # need to adjust runner's ranking accordingly. 
    
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