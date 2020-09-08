class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def up
    # the default here is definitely going to break btw
    change_column :runners, :rank_category_id, :integer, default: RankCategory.find_by(name: "bronze").id
    change_column :runners, :rank, :integer, default: nil
    change_column :registrations, :completed, :boolean, default: false
    change_column :registrations, :place, :integer, default: nil
  end

  def down
    change_column :runners, :rank_category_id, :integer
    change_column :runners, :rank, :integer
    change_column :registrations, :completed, :boolean
    change_column :registrations, :place, :integer
  end
end
