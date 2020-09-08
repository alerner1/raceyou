class CreateRunners < ActiveRecord::Migration[6.0]
  def change
    create_table :runners do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :age
      t.string :gender
      t.belongs_to :rank_category, null: false, foreign_key: true
      t.integer :rank
    end
  end
end
