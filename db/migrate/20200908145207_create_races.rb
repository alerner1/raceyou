class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :type
      t.string :length
      t.integer :elevation_increase
      t.integer :elevation_decrease
      t.datetime :expiration_date
    end
  end
end
