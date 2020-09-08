class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.belongs_to :runner, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
    end
  end
end
