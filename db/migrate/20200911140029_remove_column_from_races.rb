class RemoveColumnFromRaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :races, :race_type, :string
  end
end
