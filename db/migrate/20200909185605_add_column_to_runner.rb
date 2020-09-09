class AddColumnToRunner < ActiveRecord::Migration[6.0]
  def change
    add_column :runners, :five_k_mins, :integer
    add_column :runners, :five_k_secs, :integer, default: 0
    add_column :runners, :points, :integer, default: 0
   
  end
end
