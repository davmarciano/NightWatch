class ProfilesController < ApplicationController
  layout "application_purple"

  before_action :set_profile, only: %i[show follow]

  # Hamze search bar // controller index #view
  def index
    @users = User.all
  end

  def show
    @followers = @user.follows_by_type('User')
    @followings = @user.following_users
    @movies = @user.movies
    @watchlists = @user.watchlists
    @is_owner = current_user == @user
    @following = current_user.following?(@user)
  end

  def follow
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
    # authorize @user
  end
end
