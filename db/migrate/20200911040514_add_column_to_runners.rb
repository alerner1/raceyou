class AddColumnToRunners < ActiveRecord::Migration[6.0]
  def change
    add_column :runners, :photo, :string
  end
end
