class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show follow]

  # Hamze search bar // controller index #view
  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
    render layout: 'application_white'
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.follows_by_type('User')
    @followings = @user.following_users
    @movies = @user.movies
    @watchlists = @user.watchlists
    @is_owner = current_user == @user
    @following = current_user.following?(@user)
    render layout: 'application_purple'
  end

  def follow
    @following = current_user.following?(@user)
    if @following
      current_user.stop_following(@user)
    else
      current_user.follow(@user)
    end
    redirect_to profile_path(@user)
    # render layout: 'application_purple'
  end

  private

  def set_profile
    @user = User.find(params[:id])
    # authorize @user
  end
end
