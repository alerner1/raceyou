class DropStatsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :stats
  end
end
