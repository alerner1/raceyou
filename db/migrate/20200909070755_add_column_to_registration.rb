class AddColumnToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :finish_time, :integer
  end
end
