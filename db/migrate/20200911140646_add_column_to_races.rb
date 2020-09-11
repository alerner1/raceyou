class AddColumnToRaces < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :length_units, :string
    add_column :races, :elevation_increase_units, :string
    add_column :races, :elevation_decrease_units, :string
    remove_column :races, :length_unit, :string
  end
end
