class AddColumnToRaceCreatedBy < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :created_by, :string
  end
end


