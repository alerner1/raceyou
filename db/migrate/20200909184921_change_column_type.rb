class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :registrations, :finish_time, :time
  end
end
