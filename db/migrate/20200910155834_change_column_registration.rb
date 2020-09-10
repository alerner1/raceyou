class ChangeColumnRegistration < ActiveRecord::Migration[6.0]
  def change
    remove_column :registrations, :finish_time, :finish_time
    add_column :registrations, :finish_time_mins, :integer
    add_column :registrations, :finish_time_secs, :integer
  end
end
