class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:profile_id])
    current_user.follow(user) if current_user.following?(user) == false
    render json: { total_followers_count: user.followers.count }
  end

  def destroy
    user = Relationship.find_by(followed_id: params[:profile_id]).followed
    current_user.unfollow(user) if user
    render json: { total_followers_count: user.followers.count }
  end
end
