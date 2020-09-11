class Friendship < ApplicationRecord
  belongs_to :runner
  belongs_to :friend, class_name: "Runner"
  validates :friend_id, uniqueness: { scope: :runner_id }

  def self.create_reciprocal_for_ids(runner_id, friend_id)
    runner_friendship = Friendship.create(runner_id: runner_id, friend_id: friend_id)
    friend_friendship = Friendship.create(runner_id: friend_id, friend_id: runner_id)

    # returns array of both friendships
    [runner_friendship, friend_friendship]
  end

  def self.destroy_reciprocal_for_ids(runner_id, friend_id)
    friendship1 = Friendship.find_by(runner_id: runner_id, friend_id: friend_id)
    friendship2 = Friendship.find_by(runner_id: friend_id, friend_id: runner_id)
    friendship1.destroy
    friendship2.destroy
  end
end
