class Registration < ApplicationRecord
  belongs_to :runner
  belongs_to :race
  validates :race_id, uniqueness: { scope: :runner_id }

  def is_completed?
    if self.completed==true
      "Yes"
    else
      "No"
    end
  end

  def display_time
    if finish_time_secs < 10
      finish_time_secs = "0" + finish_time_secs.to_s
    end

    "#{finish_time_mins.to_s}:#{finish_time_secs}"
  end
end