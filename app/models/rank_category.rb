class RankCategory < ApplicationRecord
  has_many :runners

  def sort_by_points
    self.runners.sort_by { |r| r.points }
  end
end