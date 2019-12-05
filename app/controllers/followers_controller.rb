class FollowersController < ApplicationController
  def index
    @user = User.find(params[:profile_id])
    @followers = @user.followers
    @followings = @user.following_by_type('User')
  end
end
