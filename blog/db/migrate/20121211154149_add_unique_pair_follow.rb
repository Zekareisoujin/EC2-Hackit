class AddUniquePairFollow < ActiveRecord::Migration
  def up
	add_index :follows, [:follower_id, :followee_id], :unique => true
  end

  def down
  end
end
