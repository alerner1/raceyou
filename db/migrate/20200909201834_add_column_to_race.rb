class AddColumnToRace < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :closed, :boolean, default: false
  end
end
