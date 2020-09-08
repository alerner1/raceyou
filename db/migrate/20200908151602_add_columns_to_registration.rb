class AddColumnsToRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :completed, :boolean
    add_column :registrations, :place, :integer
  end
end
