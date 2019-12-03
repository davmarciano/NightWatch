class ProfilesController < ApplicationController
  layout "application_purple"

  def index
    @followings = current_user.following_users
    @followers = current_user.follows_by_type('User')
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @watchlists = @user.watchlists
    @is_owner = current_user == @user
    @following = current_user.following?(@user)
  end

  def follow
    @user = User.find(params[:id])
    @following = current_user.following?(@user)
    if @following
      current_user.stop_following(@user)
    else
      current_user.follow(@user)
    end
    redirect_to profile_path(@user)
  end

  private

  def set_profile
    @user = User.find(params[:id])
    authorize @user
  end
end
