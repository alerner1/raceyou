class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :runner, foreign_key: true
      t.belongs_to :friend
    end
  end
end
