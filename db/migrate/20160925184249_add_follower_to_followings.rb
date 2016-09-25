class AddFollowerToFollowings < ActiveRecord::Migration
  def change
    add_column :followings, :follower_id, :integer
  end
end
