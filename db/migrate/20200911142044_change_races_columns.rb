class ChangeRacesColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :races, :length, :integer
  end
end
