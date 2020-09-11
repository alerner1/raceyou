class Registration < ApplicationRecord
  belongs_to :runner
  belongs_to :race

  def is_completed?
    if self.completed==true
      "Yes"
    else
      "No"
    end
  end
end