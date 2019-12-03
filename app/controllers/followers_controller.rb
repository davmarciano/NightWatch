class FollowersController < ApplicationController
  def index
    @user = User.find(params[:profile_id])
    @followers = @user.follows_by_type('User')
    @followings = @user.following_users
  end
end
