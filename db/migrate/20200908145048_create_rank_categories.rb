class CreateRankCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :rank_categories do |t|
      t.string :name
    end
  end
end
