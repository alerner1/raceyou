class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.string :type
      t.float :statistic
      t.string :unit
      t.belongs_to :runner, null: false, foreign_key: true
    end
  end
end
