class ChangeRankCategoryIdColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :runners, :rank_category_id, :integer, default: nil
  end
end
