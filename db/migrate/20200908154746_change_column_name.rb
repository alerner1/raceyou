class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :races, :type, :race_type
    rename_column :stats, :type, :stat_type
  end
end
